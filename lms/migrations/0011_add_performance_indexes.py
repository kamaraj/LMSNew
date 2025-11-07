# Generated migration for performance optimizations

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('lms', '0010_userprofile_full_name_userprofile_login_id_and_more'),
    ]

    operations = [
        # Add indexes to UserProfile
        migrations.AlterField(
            model_name='userprofile',
            name='staff_id',
            field=models.CharField(db_index=True, max_length=20),
        ),
        migrations.AlterField(
            model_name='userprofile',
            name='role',
            field=models.CharField(choices=[('admin', 'Admin'), ('user', 'User'), ('manager', 'Manager')], db_index=True, default='user', max_length=10),
        ),
        migrations.AddIndex(
            model_name='userprofile',
            index=models.Index(fields=['department', 'role'], name='lms_userpro_departm_idx'),
        ),
        
        # Add indexes to QuestionBank
        migrations.AlterField(
            model_name='questionbank',
            name='subject_code',
            field=models.CharField(db_index=True, max_length=20),
        ),
        migrations.AddIndex(
            model_name='questionbank',
            index=models.Index(fields=['subject_code'], name='lms_questio_subject_idx'),
        ),
        
        # Add indexes to QuizResult
        migrations.AlterField(
            model_name='quizresult',
            name='set_id',
            field=models.CharField(blank=True, db_index=True, default='', max_length=100, null=True),
        ),
        migrations.AddIndex(
            model_name='quizresult',
            index=models.Index(fields=['user', 'set_id'], name='lms_quizres_user_id_set_idx'),
        ),
        migrations.AddIndex(
            model_name='quizresult',
            index=models.Index(fields=['user', 'taken_at'], name='lms_quizres_user_id_taken_idx'),
        ),
        
        # Add indexes to StaffPerformance and remove duplicate fields
        migrations.AddIndex(
            model_name='staffperformance',
            index=models.Index(fields=['user', 'year'], name='lms_staffpe_user_id_year_idx'),
        ),
        migrations.AddIndex(
            model_name='staffperformance',
            index=models.Index(fields=['year'], name='lms_staffpe_year_idx'),
        ),
    ]
