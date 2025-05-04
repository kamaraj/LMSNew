
from django.contrib.auth.models import User
from django.db import models
from django.utils import timezone
# 1️⃣ **Pastikan senarai pilihan department diletakkan SEBELUM digunakan dalam model**
DEPARTMENT_CHOICES = [
    ('ICT', 'ICT'),
    ('HR', 'Human Resources'),
    ('Finance', 'Finance'),
    ('Academic', 'Academic'),
    ('Admin', 'Administration'),
    ('Education', 'Education'),
]
# 2️⃣ **Pastikan senarai pilihan role juga didefinisikan SEBELUM digunakan**
ROLE_CHOICES = [
    ('Admin', 'Admin'),
    ('Staff', 'Staff'),
]
class UserProfile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    staff_id = models.CharField(max_length=20)
    full_name = models.CharField(max_length=100)
    department = models.CharField(max_length=255)
    position = models.CharField(max_length=100)
    login_id = models.CharField(max_length=50)
    ROLE_CHOICES = (
        ('admin', 'Admin'),
        ('user', 'User'),
        ('manager', 'Manager'),
    )
    role = models.CharField(max_length=10, choices=ROLE_CHOICES, default='user')
    def __str__(self):
        return self.user.username
# Model untuk kategori
class Category(models.Model):
    id = models.CharField(max_length=20, unique=True, default="CAT000",primary_key=True)  # ✅ max_length
    name = models.CharField(max_length=100, unique=True)  # ✅ max_length
    description = models.TextField(blank=True, null=True)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return self.name
    
class Person(models.Model):
    name = models.CharField(max_length=100)
    email = models.EmailField(unique=True)
    age = models.IntegerField()
    def __str__(self):
        return self.name
    
class Course(models.Model):
    category = models.ForeignKey(Category, on_delete=models.CASCADE, null=True, blank=True)
    course_id = models.CharField(max_length=20, default=1)  # ✅ max_length
    title = models.CharField(max_length=255, unique=True)  # ✅ max_length
    description = models.TextField()
    start_date = models.DateField() 
    end_date = models.DateField()
    def __str__(self):
        return self.title
    
# Model untuk modul dalam kursus
class Module(models.Model):
    course = models.ForeignKey(Course, on_delete=models.CASCADE, related_name="modules")
    module_id = models.CharField(max_length=50)  # ID Modul
    title = models.CharField(max_length=255)
    content_type = models.CharField(max_length=50, choices=[('video', 'Video'), ('pdf', 'PDF'), ('quiz', 'Quiz')])
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f"{self.title} - {self.course.title}"
    
# Model untuk kuiz dalam modul
class Quiz(models.Model):
    module = models.ForeignKey(Module, on_delete=models.CASCADE, null=True, blank=True)
    quiz_id = models.CharField(max_length=50)
    title = models.CharField(max_length=255)
    total_questions = models.IntegerField(default=20)
    difficulty = models.CharField(max_length=50, choices=[('easy', 'Easy'), ('medium', 'Medium'), ('hard', 'Hard')])
    created_at = models.DateTimeField(default=timezone.now)
    updated_at = models.DateTimeField(auto_now=True)
    def __str__(self):
        return f"{self.title} - {self.module.title}"
    
class Batch(models.Model):
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
    
class QuizSet(models.Model):
    batch = models.ForeignKey(Batch, on_delete=models.CASCADE)
    name = models.CharField(max_length=255)
    created_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return self.name
    
class QuizQuestion(models.Model):
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, related_name='questions',null=True)  # Tambah ini
    quiz_title = models.CharField(max_length=255)  # Tajuk kuiz
    question_text = models.TextField()  # Soalan
    choice_A = models.CharField(max_length=255)  # Pilihan A
    choice_B = models.CharField(max_length=255)  # Pilihan B
    choice_C = models.CharField(max_length=255)  # Pilihan C
    choice_D = models.CharField(max_length=255)  # Pilihan D
    correct_answer = models.CharField(max_length=1)  # Jawapan betul (A, B, C, D)
    def __str__(self):
        return self.question_text
    
# Model untuk keputusan kuiz
class QuizResult(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE, null=True, blank=True, default=None)  # ✅ wajib untuk user_id
    quiz = models.ForeignKey(Quiz, on_delete=models.CASCADE, null=True)
    set_id = models.CharField(max_length=100, null=True, blank=True, default='')
    cluster = models.CharField(max_length=100, null=True)
    total_questions = models.IntegerField(null=True)
    score = models.IntegerField()
    percentage = models.DecimalField(max_digits=5, decimal_places=2, null=True)
    taken_at = models.DateTimeField(auto_now_add=True)
    def __str__(self):
        return f"{self.user.user.username} - {self.quiz.title} - {self.score}"
    
# Model untuk prestasi staf
class StaffPerformance(models.Model):
    user = models.ForeignKey(UserProfile, on_delete=models.CASCADE, related_name="staff_performance")
    year = models.IntegerField()  # Tahun dari dataset
    average_score = models.FloatField()  # Purata markah
    progress_percentage = models.FloatField()  # Peratusan kemajuan
    name = models.CharField(max_length=255, default="Unknown")  # Tambah default value
    year = models.IntegerField()
    average_score = models.FloatField()
    progress_percentage = models.FloatField()
    def __str__(self):
        return f"{self.user.username} - {self.year} - {self.average_score}%"
    
# Model untuk bahasa
class Language(models.Model):
    name = models.CharField(max_length=100, unique=True)
    def __str__(self):
        return self.name
# Model untuk bidang STEM
class STEM(models.Model):
    field_name = models.CharField(max_length=255, unique=True)
    def __str__(self):
        return self.field_name
# Tambah Batch untuk "Lencana Performance"
#batch3 = Batch.objects.create(name="Lencana Performance")
class QuestionBank(models.Model):
    question_id = models.AutoField(primary_key=True)  # ← ini penting
    subject_code = models.CharField(max_length=20)
    question_text = models.TextField()
    choice_a = models.CharField(max_length=255)
    choice_b = models.CharField(max_length=255)
    choice_c = models.CharField(max_length=255)
    choice_d = models.CharField(max_length=255)
    correct_answer = models.CharField(max_length=1)
    class Meta:
        db_table = 'lms_questionbank'
        
class StaffPerformanceData(models.Model):
    number = models.IntegerField()
    name = models.CharField(max_length=100)
    staff_id = models.CharField(max_length=100)
    user_id = models.IntegerField()
    position = models.CharField(max_length=100)
    department = models.CharField(max_length=100)
    finance_management = models.IntegerField()
    generic = models.IntegerField()
    ict = models.IntegerField()
    innovation = models.IntegerField()
    language = models.IntegerField()
    stem = models.IntegerField()
    total_courses = models.IntegerField()
    marks_2020 = models.IntegerField()
    class Meta:
        managed = False
        db_table = 'lms_staff_performance'  # Link ke table MySQL
