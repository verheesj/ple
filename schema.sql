CREATE TABLE curriculum_stages (
    stage_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    description TEXT
);

CREATE TABLE school_years (
    year_id INT PRIMARY KEY AUTO_INCREMENT,
    stage_id INT,
    year_name VARCHAR(50),
    FOREIGN KEY (stage_id) REFERENCES curriculum_stages(stage_id)
);

CREATE TABLE subjects (
    subject_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100)
);

CREATE TABLE skill_categories (
    category_id INT PRIMARY KEY AUTO_INCREMENT,
    subject_id INT,
    name VARCHAR(100),
    description TEXT,
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE specific_skills (
    skill_id INT PRIMARY KEY AUTO_INCREMENT,
    category_id INT,
    name VARCHAR(100),
    description TEXT,
    FOREIGN KEY (category_id) REFERENCES skill_categories(category_id)
);

CREATE TABLE year_subject_curriculum (
    id INT PRIMARY KEY AUTO_INCREMENT,
    year_id INT,
    subject_id INT,
    FOREIGN KEY (year_id) REFERENCES school_years(year_id),
    FOREIGN KEY (subject_id) REFERENCES subjects(subject_id)
);

CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    age INT
);

CREATE TABLE student_progress (
    progress_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    year_id INT,
    category_id INT,
    skill_id INT,
    SmartScore DECIMAL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (year_id) REFERENCES school_years(year_id),
    FOREIGN KEY (category_id) REFERENCES skill_categories(category_id),
    FOREIGN KEY (skill_id) REFERENCES specific_skills(skill_id)
);

CREATE TABLE student_persona (
    persona_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

CREATE TABLE emotional_states (
    state_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50),
    description TEXT
);


CREATE TABLE learning_styles (
    style_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    description TEXT
);

ALTER TABLE students
ADD persona_id INT,
ADD state_id INT,
ADD style_id INT,
FOREIGN KEY (persona_id) REFERENCES student_persona(persona_id),
FOREIGN KEY (state_id) REFERENCES emotional_states(state_id),
FOREIGN KEY (style_id) REFERENCES learning_styles(style_id);

CREATE TABLE questions (
    question_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_id INT,
    difficulty_level INT,
    text TEXT,
    FOREIGN KEY (skill_id) REFERENCES specific_skills(skill_id)
);

CREATE TABLE student_answers (
    answer_id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT,
    student_id INT,
    correct BOOLEAN,
    response_time TIME,
    FOREIGN KEY (question_id) REFERENCES questions(question_id),
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE student_collaboration (
    collaboration_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT,
    description TEXT,
    points DECIMAL,
    FOREIGN KEY (student_id) REFERENCES students(student_id)
);

CREATE TABLE skill_relationships (
    relationship_id INT PRIMARY KEY AUTO_INCREMENT,
    skill_id_1 INT,
    skill_id_2 INT,
    relationship_type VARCHAR(50),
    FOREIGN KEY (skill_id_1) REFERENCES specific_skills(skill_id),
    FOREIGN KEY (skill_id_2) REFERENCES specific_skills(skill_id)
);
