DROP TABLE IF EXISTS lms_questionbank;
CREATE TABLE lms_questionbank (
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

