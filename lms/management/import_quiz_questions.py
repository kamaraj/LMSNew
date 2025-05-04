import os
import csv
import django

# Set up Django settings
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'ELITE_NEW.settings')
django.setup()  # Ensure Django is initialized before importing models

from django.core.management.base import BaseCommand
from lms.models import QuizQuestion  # Correct Import Path
 # Import AFTER django.setup()

class Command(BaseCommand):
    help = 'Import quiz questions from a CSV file into SQLite database'

    def add_arguments(self, parser):
        parser.add_argument('csv_file', type=str, help='Path to the CSV file')

    def handle(self, *args, **kwargs):
        csv_file = kwargs['csv_file']

        if not os.path.exists(csv_file):
            self.stdout.write(self.style.ERROR(f"File '{csv_file}' not found."))
            return

        with open(csv_file, newline='', encoding='utf-8') as file:
            reader = csv.DictReader(file)

            for row in reader:
                try:
                    question_id = int(row['ID Soalan'])
                    question_number = int(row['No Soalan'])
                    question_text = row['Soalan']
                    answer_choice = row['Pilihan Jawapan']
                    correct_answer = row.get('Jawapan Betul', None)

                    question, created = QuizQuestion.objects.get_or_create(
                        question_id=question_id,
                        question_number=question_number,
                        question_text=question_text,
                        answer_choice=answer_choice,
                        correct_answer=correct_answer
                    )

                    if created:
                        self.stdout.write(self.style.SUCCESS(f"Added question {question_number}"))
                    else:
                        self.stdout.write(self.style.WARNING(f"Question {question_number} already exists"))
                except Exception as e:
                    self.stdout.write(self.style.ERROR(f"Error importing row {row}: {e}"))
