
from django import forms
from django.contrib.auth.models import User
from .models import UserProfile, StaffPerformance
class UserRegisterForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput)
    password2 = forms.CharField(label='Sahkan Kata Laluan', widget=forms.PasswordInput)
    role = forms.ChoiceField(choices=UserProfile.ROLE_CHOICES)
    staff_id = forms.CharField(label='Staff ID')
    full_name = forms.CharField(label='Nama Penuh')
    department = forms.CharField(label='Jabatan')
    position = forms.CharField(label='Jawatan')
    login_id = forms.CharField(label='Login ID')
    email = forms.EmailField(label='Email')
    
    class Meta:
        model = User
        model = User
        fields = ['username', 'email', 'password']
    def clean_password2(self):
        cd = self.cleaned_data
        if cd.get('password') != cd.get('password2'):
            raise forms.ValidationError("Kata laluan tidak sepadan.")
        return cd['password2']
