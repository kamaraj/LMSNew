from django.urls import path 
from . import views
from django.contrib.auth import views as auth_views
from django.contrib.auth.views import LogoutView
from .models import StaffPerformance
from .views import chatbot_api

urlpatterns = [
    path('', views.home, name='home'),
    path('register/', views.register_view, name='register'),
    path('login/', views.user_login, name='login'),
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
    path('dashboard/special-access/', views.special_dashboard_access, name='special_dashboard_access'),
    path('dashboard/special/', views.special_dashboard, name='special_dashboard'),
    path('api/chatbot/', chatbot_api, name='chatbot_api'),
 

    # -------------------------
    # 🔐 Password Reset
    # -------------------------
    path('password-reset/', auth_views.PasswordResetView.as_view(template_name='password_reset.html'), name='password_reset'),
    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'), name='password_reset_done'),

    # Redirect Selepas Login ikut Role
    path('dashboard/', views.dashboard_redirect, name='dashboard_redirect'),

    # Dashboard ikut role
    path('dashboard/admin/', views.admin_dashboard, name='admin_dashboard'),
    path('dashboard/user/', views.user_dashboard, name='user_dashboard'),
    path('dashboard/manager/', views.top_management_dashboard, name='top_management_dashboard'),
    
    # Paparan kuiz
    path('kuiz/', views.kuiz_view, name='kuiz'),  # ✅ BETUL → guna kuiz_view

    # Submit kuiz
    path('kuiz/submit/', views.submit_quiz, name='submit_quiz'),

    # Import question bank
    path('import-question-bank/', views.import_question_bank, name='import_question_bank'),

    # Reset password
    path('password-reset/', auth_views.PasswordResetView.as_view(template_name='password_reset.html'), name='password_reset'),
    path('password-reset/done/', auth_views.PasswordResetDoneView.as_view(template_name='password_reset_done.html'), name='password_reset_done'),

    # Logout
    path('logout/', LogoutView.as_view(next_page='login'), name='logout'),
]
