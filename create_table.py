import sqlite3

# Sambung ke database SQLite
conn = sqlite3.connect("db.sqlite3")
cursor = conn.cursor()

# SQL untuk cipta jadual
create_table_query = """
CREATE TABLE IF NOT EXISTS lms_questionbank (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    subject_code TEXT,
    subject TEXT,
    question_id INTEGER,
    question TEXT,
    choice_a TEXT,
    choice_b TEXT,
    choice_c TEXT,
    choice_d TEXT,
    correct_answer TEXT
);
"""
cursor.execute(create_table_query)
conn.commit()

print("✅ Jadual lms_questionbank berjaya dicipta!")

# Tutup sambungan database
conn.close()
