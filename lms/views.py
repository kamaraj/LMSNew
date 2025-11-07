# -------------------------
# 📦 Import
# -------------------------
from django.shortcuts import render, redirect
from django.http import HttpResponse, JsonResponse
from django.contrib import messages
from django.views.decorators.csrf import csrf_exempt
from django.contrib.auth import authenticate, login
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User
import csv
import pandas as pd
import random
from django.db import connection
from django.utils import timezone
import json
from django.core.serializers.json import DjangoJSONEncoder


# 📦 Import Model
from .models import QuizQuestion, QuestionBank, UserProfile, Quiz, QuizResult, Course, Module, StaffPerformance
# -------------------------

# 🏠 Halaman Awal / Utama
# -------------------------
def home(request):
    return render(request, 'home.html')

# 🔐 Pengurusan Login & Register
# -------------------------
def user_login(request):
    if request.method == 'POST':
        username = request.POST.get('username')
        password = request.POST.get('password')
        user = authenticate(request, username=username, password=password)
        if user is not None:
            login(request, user)
            return redirect('user_dashboard')
        else:
            messages.error(request, 'Nama pengguna atau kata laluan salah.')
    return render(request, 'login.html')

def register_view(request):
    if request.method == 'POST':
        form = UserCreationForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Pendaftaran berjaya! Sila log masuk.')
            return redirect('login')
    else:
        form = UserCreationForm()
    return render(request, 'lms/register.html', {'form': form})

@login_required
def after_login_view(request):
    if request.user.is_superuser:
        return redirect('/admin/')
    else:
        return redirect('user_dashboard')

# 🔀 Redirect Dashboard Mengikut Role
# -------------------------
@login_required
def dashboard_redirect(request):
    try:
        # Get user profile - no need for select_related since we already have the user
        user_profile = UserProfile.objects.get(user=request.user)
        role = user_profile.role
    except UserProfile.DoesNotExist:
        return redirect('login')
    
    if role == 'admin':
        return redirect('admin_dashboard')
    elif role == 'user':
        return redirect('user_dashboard')
    elif role == 'manager':
        return redirect('top_management_dashboard')
    else:
        return redirect('login')

# 🧑‍💼 Admin Dashboard
@login_required
def admin_dashboard(request):
    return render(request, 'admin_dashboard.html')

# 🧑‍💼 Top Management Dashboard
@login_required
def top_management_dashboard(request):
    return render(request, 'top_management_dashboard.html')

# 🧑‍💼 Dashboard Pengguna
# -------------------------
@login_required
def user_dashboard(request):
    user_profile, _ = UserProfile.objects.get_or_create(user=request.user)
    
    # Optimize: Fetch both results in a single query with select_related
    quiz_results = QuizResult.objects.filter(
        user=user_profile, 
        set_id__in=['BM101', 'PB100']
    ).select_related('quiz')
    
    # Convert to dictionary for easy lookup
    results_dict = {result.set_id: result for result in quiz_results}
    bm101_result = results_dict.get('BM101')
    pb100_result = results_dict.get('PB100')
    
    total_score = 0
    total_questions = 0
    if bm101_result:
        total_score += bm101_result.score
        total_questions += bm101_result.total_questions
    if pb100_result:
        total_score += pb100_result.score
        total_questions += pb100_result.total_questions
    user_progress = round((total_score / total_questions) * 100, 2) if total_questions > 0 else 0
    
    return render(request, 'user_dashboard.html', {
        'bm101_result': bm101_result,
        'pb100_result': pb100_result,
        'user_progress': user_progress
    })

# 📖 Paparan Kuiz
# -------------------------
@login_required
def kuiz_view(request):
    kod_subjek = request.GET.get('set', 'BM101')
    
    # Optimize: Use efficient random selection instead of order_by('?')
    # First get the count and then sample random IDs
    all_questions = QuestionBank.objects.filter(subject_code=kod_subjek)
    total_count = all_questions.count()
    
    if total_count <= 20:
        soalan_list = list(all_questions)
    else:
        # Get random sample of IDs and fetch those questions
        all_ids = list(all_questions.values_list('question_id', flat=True))
        random_ids = random.sample(all_ids, min(20, len(all_ids)))
        soalan_list = list(QuestionBank.objects.filter(question_id__in=random_ids))
    
    if request.method == 'POST':
        markah = 0
        for soalan in soalan_list:
            jawapan = request.POST.get(str(soalan.question_id))
            if jawapan and jawapan.upper() == soalan.correct_answer:
                markah += 1
        peratus = round((markah / len(soalan_list)) * 100, 2)
        request.session['quiz_result'] = {
            'markah': markah,
            'jumlah': len(soalan_list),
            'peratus': peratus,
            'subject': kod_subjek
        }
        cluster_map = {
            "BM101": "Language",
            "PB100": "Generic",
            "ICT200": "ICT",
            "FIN300": "Finance Management",
            "INN400": "Innovation",
            "STEM500": "STEM"
        }
        cluster = cluster_map.get(kod_subjek, "Unknown")
        course_title = "Kursus " + kod_subjek
        course_obj, created = Course.objects.get_or_create(
            title=course_title,
            defaults={'start_date': timezone.now(), 'end_date': timezone.now()}
        )
        module_obj = Module.objects.filter(title=kod_subjek).first()
        if not module_obj:
            module_obj = Module.objects.create(title=kod_subjek, course=course_obj)
        user_profile, _ = UserProfile.objects.get_or_create(user=request.user)
        quiz_obj, created = Quiz.objects.get_or_create(
            title=f"Quiz {kod_subjek}",
            defaults={'module': module_obj, 'created_at': timezone.now(), 'updated_at': timezone.now()}
        )
        QuizResult.objects.create(
            user=user_profile,
            quiz=quiz_obj,
            set_id=kod_subjek,
            cluster=cluster,
            total_questions=len(soalan_list),
            score=markah,
            percentage=peratus,
            taken_at=timezone.now()
        )
        return redirect('user_dashboard')
    return render(request, 'kuiz.html', {
        'soalan_list': soalan_list,
        'subject_code': kod_subjek
    })

# 📝 Paparan Kuiz Interaktif (Dinamik)
# -------------------------
@login_required
def kuiz_page(request):
    # Optimize: Use efficient random selection instead of order_by('?')
    all_questions = QuestionBank.objects.filter(subject_code='BM101')
    total_count = all_questions.count()
    
    if total_count <= 20:
        soalan_list = list(all_questions)
    else:
        all_ids = list(all_questions.values_list('question_id', flat=True))
        random_ids = random.sample(all_ids, min(20, len(all_ids)))
        soalan_list = list(QuestionBank.objects.filter(question_id__in=random_ids))
    
    result = {'markah': 0, 'jumlah': len(soalan_list), 'peratus': 0}
    if request.method == 'POST':
        markah = 0
        jumlah = len(soalan_list)
        for soalan in soalan_list:
            jawapan_user = request.POST.get(str(soalan.question_id))
            if jawapan_user and jawapan_user.upper() == soalan.correct_answer:
                markah += 1
        peratus = round((markah / jumlah) * 100, 2) if jumlah > 0 else 0
        result = {'markah': markah, 'jumlah': jumlah, 'peratus': peratus}
    return render(request, 'kuiz.html', {
        'soalan_list': soalan_list,
        'result': result
    })

# ✅ Hantar Kuiz (Statik)
# -------------------------
@login_required
def submit_quiz(request):
    if request.method == 'POST':
        answer = request.POST.get('q1')
        return redirect('user_dashboard')
    return redirect('kuiz')

# 🗕 Import CSV untuk Question Bank
# -------------------------
@login_required
def import_question_bank(request):
    if request.method == 'POST':
        csv_file = request.FILES['csv_file']
        decoded_file = csv_file.read().decode('utf-8').splitlines()
        reader = csv.DictReader(decoded_file)
        required_columns = ['subject_code', 'question_text', 'choice_a', 'choice_b', 'choice_c', 'choice_d', 'correct_answer']
        missing_columns = [col for col in required_columns if col not in reader.fieldnames]
        if missing_columns:
            return HttpResponse(f"Error: Missing columns in CSV file: {', '.join(missing_columns)}", status=400)
        
        # Optimize: Use bulk_create instead of individual creates
        questions_to_create = []
        for row in reader:
            questions_to_create.append(QuestionBank(
                subject_code=row['subject_code'],
                question_text=row['question_text'],
                choice_a=row['choice_a'],
                choice_b=row['choice_b'],
                choice_c=row['choice_c'],
                choice_d=row['choice_d'],
                correct_answer=row['correct_answer']
            ))
        
        # Bulk insert all questions at once
        QuestionBank.objects.bulk_create(questions_to_create, batch_size=500)
        
        return HttpResponse('✅ Question bank imported successfully!')
    return render(request, 'import_question_bank.html')

# 🔐 Akses Khas Dashboard
# -------------------------
@login_required
def special_dashboard_access(request):
    if request.method == 'POST':
        password = request.POST.get('password')
        if password == 'passwordkuat123':
            return redirect('special_dashboard')
        else:
            messages.error(request, 'Password salah!')
            return redirect('special_dashboard_access')
    return render(request, 'special_access.html')

# 📊 Dashboard Khas (Total Course)
# -------------------------
from .models import StaffPerformanceData as StaffPerformance
from django.db.models import Sum

@login_required
def special_dashboard(request):
    kpi_data = StaffPerformance.objects.aggregate(
        total_courses=Sum('total_courses'),
        total_generic=Sum('generic'),
        total_ict=Sum('ict'),
        total_language=Sum('language'),
        total_innovation=Sum('innovation'),
        total_stem=Sum('stem')
    )
    dept_performance = StaffPerformance.objects.values('department').annotate(total_courses=Sum('total_courses'))
    cluster_course = StaffPerformance.objects.values('department').annotate(
        generic=Sum('generic'),
        ict=Sum('ict'),
        language=Sum('language'),
        innovation=Sum('innovation'),
        stem=Sum('stem')
    )
    pie_department = StaffPerformance.objects.values('department').annotate(total_courses=Sum('total_courses'))
    staff_list = StaffPerformance.objects.values(
        'name', 'position', 'department', 'total_courses'
    )
    context = {
        'kpi_data': kpi_data,
        'dept_performance': json.dumps(list(dept_performance), cls=DjangoJSONEncoder),
        'cluster_course': json.dumps(list(cluster_course), cls=DjangoJSONEncoder),
        'pie_department': json.dumps(list(pie_department), cls=DjangoJSONEncoder),
        'staff_list': json.dumps(list(staff_list), cls=DjangoJSONEncoder)
    }
    return render(request, 'special_dashboard.html', context)

# 🤖 API Chatbot LMS ELITE
# -------------------------
@csrf_exempt
def chatbot_api(request):
    if request.method == "POST":
        data = json.loads(request.body)
        user_input = data.get("message", "").lower()

        faq = {
            "bm101": "BM101 ialah kursus Kesusasteraan Bahasa Melayu.",
            "objektif": "Objektif kursus PB100 ialah membina kemahiran pedagogi dan profesionalisme.",
            "tempoh": "Tempoh kursus BM101 ialah 3 minggu.",
            "kluster": "Kursus ini tergolong dalam Kluster Bahasa.",
            "hasil": "Hasil pembelajaran ialah kefahaman teori dan amalan pendidikan.",
            "jawab kuiz": "Kuiz boleh dijawab selepas anda melengkapkan video pembelajaran.",
            "jumlah soalan": "Ujian 1 mempunyai 20 soalan objektif pelbagai pilihan.",
            "keputusan": "Keputusan boleh dilihat dalam bahagian Keputusan Ujian di dashboard anda.",
            "syarat lulus": "Syarat lulus ialah minimum 86% daripada jumlah keseluruhan markah.",
            "ulang kuiz": "Kuiz boleh diulang sekali sekiranya gagal.",
            "modul": "Terdapat 3 modul utama dalam setiap kursus.",
            "video": "Video pembelajaran boleh ditonton dalam bahagian Modul Video.",
            "nota": "Nota PB100 boleh dimuat turun di bahagian Nota & PDF.",
            "topik": "Topik termasuk pengenalan, teori pendidikan, dan aplikasi pengajaran.",
            "sijil": "Sijil akan diberikan secara automatik selepas tamat semua kursus dan kuiz.",
            "terima sijil": "Sijil dijana dalam masa 1 hari selepas tamat kursus.",
            "ramalan markah": "Ramalan markah menunjukkan prestasi dijangka berdasarkan ujian terdahulu.",
            "status dikira": "Status dikira berdasarkan purata 3 ujian termasuk prediction.",
            "hubungi admin": "Sila hubungi admin melalui WhatsApp IPGKRM atau e-mel rasmi.",
            "siapa": "Sistem ini dibangunkan oleh Noor Azlida Ali dari IPGM Kampus Raja Melewar.",
            "berfungsi": "Chatbot ini berfungsi berdasarkan keyword yang dipadankan dengan soalan anda.",
            "bahasa": "Anda boleh tukar antara Bahasa Melayu dan English di menu paparan."
        }

        response_text = "Maaf, saya tidak faham soalan itu. Sila tanya tentang kursus, kuiz atau sijil."
        for keyword, answer in faq.items():
            if keyword in user_input:
                response_text = answer
                break

        return JsonResponse({"response": response_text})

    return JsonResponse({"response": "Invalid request"}, status=400)

# dalam views.py
from lms.ml_models.predict_exam import predict_mark
from .models import StaffPerformance  # sesuaikan nama model anda

def show_prediction(request, user_id):
    # Optimize: Use select_related to avoid N+1 query
    staff = StaffPerformance.objects.select_related('user').get(user_id=user_id)

    predicted_mark = predict_mark(
        staff.marks_2020,
        staff.marks_2021,
        staff.marks_2022,
        staff.marks_2023
    )

    return render(request, 'dashboard.html', {
        'staff': staff,
        'predicted_mark': predicted_mark
    })
