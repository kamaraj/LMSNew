from django.core.management.base import BaseCommand
import csv
from lms.models import QuestionBank

class Command(BaseCommand):
    help = 'Import question bank data from a CSV file into the QuestionBank model.'

    def add_arguments(self, parser):
        parser.add_argument('csv_file', type=str, help='The path to the CSV file to import.')

    def handle(self, *args, **kwargs):
        csv_file = kwargs['csv_file']

        try:
            with open(csv_file, mode='r', encoding='utf-8') as file:
                reader = csv.DictReader(file)
                for row in reader:
                    QuestionBank.objects.create(
                        subject_code=row['subject_code'],
                        question_text=row['question_text'],
                        choice_a=row['choice_a'],
                        choice_b=row['choice_b'],
                        choice_c=row['choice_c'],
                        choice_d=row['choice_d'],
                        correct_answer=row['correct_answer']
                    )
            self.stdout.write(self.style.SUCCESS('Successfully imported data from %s' % csv_file))
        except Exception as e:
            self.stderr.write(self.style.ERROR('Error importing data: %s' % str(e)))