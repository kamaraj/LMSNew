# ml_models/predict_exam.py
import pandas as pd
import joblib
import os
from sklearn.ensemble import RandomForestRegressor
from sklearn.model_selection import train_test_split

BASE_DIR = os.path.dirname(os.path.dirname(os.path.abspath(__file__)))
MODEL_PATH = os.path.join(BASE_DIR, 'lms', 'ml_models', 'final_exam_model.pkl')

# Cache the loaded model to avoid repeated file I/O
_cached_model = None

def _load_model():
    """Load the model once and cache it for subsequent calls."""
    global _cached_model
    if _cached_model is None:
        model_path = os.path.join(os.path.dirname(__file__), 'final_exam_model.pkl')
        _cached_model = joblib.load(model_path)
    return _cached_model

def train_model():
    # Baca dataset CSV
    df = pd.read_csv('your_dataset.csv')  # <-- Gantikan dengan path fail anda

    # Feature dan target
    X = df[['marks_2020', 'marks_2021', 'marks_2022', 'marks_2023']]
    y = df['marks_2024']

    # Split data untuk training dan testing
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Guna Random Forest Regressor
    model = RandomForestRegressor(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)

    # Simpan model
    joblib.dump(model, MODEL_PATH)
    print(f"✅ Model berjaya dilatih dan disimpan di {MODEL_PATH}.")

# ml_models/predict_exam.py (tambahan)
def predict_mark(marks_2020, marks_2021, marks_2022, marks_2023):
    # Load cached model
    model = _load_model()

    # Susun input
    input_data = [[marks_2020, marks_2021, marks_2022, marks_2023]]

    # Ramal markah
    predicted = model.predict(input_data)[0]
    return round(predicted, 2)

# Fungsi baru: predict hanya dengan 2 markah dan user id
def predict_mark_for_user(user_id, marks_1, marks_2):
    """
    Predict the next exam mark for a user given two marks (marks_1, marks_2).
    The other two marks will be set to 0 by default.
    """
    # Load cached model
    model = _load_model()
    input_data = [[marks_1, marks_2, 0, 0]]
    predicted = model.predict(input_data)[0]
    print(f"User ID: {user_id}, Marks: {marks_1}, {marks_2} => Predicted: {predicted}")
    return round(predicted, 2)

# Contoh penggunaan
if __name__ == "__main__":
    # Contoh asal: 4 markah
    result = predict_mark(80, 75, 70, 65)
    print(f"Prediction markah ujian ke-5 (4 marks): {result}")

    # Contoh baru: 2 markah + user id
    user_id = 123
    marks_1 = 80
    marks_2 = 75
    result2 = predict_mark_for_user(user_id, marks_1, marks_2)
    print(f"Prediction markah ujian ke-5 (2 marks, user {user_id}): {result2}")

