# ml_models/train_model.py
import sys
import os
sys.path.append(os.path.dirname(os.path.dirname(os.path.dirname(os.path.abspath(__file__)))))
import pandas as pd
from sklearn.ensemble import RandomForestRegressor
import joblib
import mysql.connector


# --- Use Django settings for DB connection ---
import django
os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'elite_new.settings')
django.setup()
from django.conf import settings

def train_model():
    db_settings = settings.DATABASES['default']
    conn = mysql.connector.connect(
        host=db_settings['HOST'],
        user=db_settings['USER'],
        password=db_settings['PASSWORD'],
        database=db_settings['NAME'],
        port=int(db_settings.get('PORT', 3306))
    )

    query = """
        SELECT marks_2020, marks_2021, marks_2022, marks_2023, marks_2024
        FROM lms_staff_performance
        WHERE marks_2020 IS NOT NULL AND marks_2024 IS NOT NULL
    """
    df = pd.read_sql(query, conn)
    conn.close()

    X = df[['marks_2020', 'marks_2021', 'marks_2022', 'marks_2023']]
    y = df['marks_2024']

    model = RandomForestRegressor(n_estimators=100, random_state=42)
    model.fit(X, y)

    # Simpan model
    joblib.dump(model, 'ml_models/final_exam_model.pkl')
    print("✅ Model telah dilatih dan disimpan.")
