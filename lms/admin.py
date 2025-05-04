from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from .models import (  # Pastikan semua model diimport dengan betul
    UserProfile, Course, Module, Quiz, QuizResult,
    StaffPerformance, Category, Language, STEM)
from .models import StaffPerformance



# 1️⃣ Konfigurasi untuk UserProfile dalam Django Admin
class UserProfileInline(admin.StackedInline):
    model = UserProfile
    extra = 0  # Hanya satu UserProfile per User
    can_delete = False
    verbose_name_plural = 'User Profiles'

# 2️⃣ Konfigurasi UserProfile sebagai ModelAdmin tersendiri
class UserProfileAdmin(admin.ModelAdmin):
    list_display = ('staff_id', 'user', 'department', 'role')
    list_filter = ('department', 'position')  # contoh yang betul
    search_fields = ('staff_id', 'user__username', 'user__email')

# 3️⃣ Kembangkan UserAdmin supaya ada UserProfile
class CustomUserAdmin(UserAdmin):
    inlines = [UserProfileInline]  # Gunakan list [] untuk elakkan error

# 4️⃣ Daftarkan User dengan CustomUserAdmin
admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

# 5️⃣ Daftarkan semua model lain dalam Admin Panel
admin.site.register(UserProfile, UserProfileAdmin)
admin.site.register(Course)
admin.site.register(Module)
admin.site.register(Quiz)
admin.site.register(QuizResult)
admin.site.register(StaffPerformance)
admin.site.register(Category)
admin.site.register(Language)
admin.site.register(STEM)
