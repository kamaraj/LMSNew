import sqlite3
import pandas as pd

# Sambung ke database SQLite
conn = sqlite3.connect("db.sqlite3")
cursor = conn.cursor()

# Path penuh ke fail CSV
csv_file = r"D:\PROJECT\DATASET\soalan kuiz\question_bank_final.csv"

# Baca fail CSV
df = pd.read_csv(csv_file)

# Pastikan nama lajur sesuai dengan database
df.columns = ["subject_code", "subject", "question_id", "question_text", "choice_a", "choice_b", "choice_c", "choice_d", "correct_answer"]



# Masukkan data ke dalam SQLite
for _, row in df.iterrows():
  cursor.execute("""
    INSERT INTO lms_questionbank (subject_code, subject, question_id, question_text, choice_a, choice_b, choice_c, choice_d, correct_answer)
    VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)
""", (row["subject_code"], row["subject"], row["question_id"], row["question_text"], row["choice_a"], row["choice_b"], row["choice_c"], row["choice_d"], row["correct_answer"]))


# Simpan ke database
conn.commit()
print("✅ Data dari CSV berjaya dimasukkan ke dalam lms_questionbank!")

# Tutup sambungan database
conn.close()
