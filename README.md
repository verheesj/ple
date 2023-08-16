**credit to chatgpt for this lol**
### 1. Curriculum Stages

This table defines various stages in the curriculum, e.g., Key Stage 2, Key Stage 3.

- `stage_id`: A unique identifier for each curriculum stage.
- `name`: The name of the curriculum stage.
- `description`: A brief description of the stage.

**Example:**

```sql
INSERT INTO curriculum_stages (name, description) VALUES
('Key Stage 2', 'Primary education for Year 3 to Year 6'),
('Key Stage 3', 'Secondary education for Year 7 to Year 11');
```

### 2. School Years

Defines the year groups within each curriculum stage.

- `year_id`: A unique identifier for each school year.
- `stage_id`: Refers to the corresponding curriculum stage.
- `year_name`: The name of the school year.

**Example:**

```sql
INSERT INTO school_years (stage_id, year_name) VALUES
(1, 'Year 3'),
(1, 'Year 4'),
(2, 'Year 7');
```

### 3. Subjects

Defines the different subjects that are taught, e.g., Maths, English.

- `subject_id`: A unique identifier for each subject.
- `name`: The name of the subject.

**Example:**

```sql
INSERT INTO subjects (name) VALUES ('Maths'), ('English');
```

### 4. Skill Categories

Represents categories of skills within each subject, e.g., Whole Numbers in Maths.

- `category_id`: A unique identifier for each skill category.
- `subject_id`: Refers to the related subject.
- `name`: The name of the skill category.
- `description`: A brief description of the category.

**Example:**

```sql
INSERT INTO skill_categories (subject_id, name, description) VALUES
(1, 'Whole Numbers', 'Skills related to whole numbers');
```

### 5. Specific Skills

Details specific skills within each skill category, e.g., Rounding, Roman Numerals.

- `skill_id`: A unique identifier for each specific skill.
- `category_id`: Refers to the related skill category.
- `name`: The name of the specific skill.
- `description`: A brief description of the skill.

**Example:**

```sql
INSERT INTO specific_skills (category_id, name, description) VALUES
(1, 'Rounding', 'Rounding whole numbers'),
(1, 'Roman Numerals', 'Understanding Roman numerals');
```

### 6. Year Subject Curriculum

Connects subjects to specific year groups, defining what subjects are taught in each year.

- `id`: A unique identifier.
- `year_id`: Refers to the related year group.
- `subject_id`: Refers to the related subject.

**Example:**

```sql
INSERT INTO year_subject_curriculum (year_id, subject_id) VALUES
(1, 1),
(3, 1);
```

### 7. Students

Holds information about individual students.

- `student_id`: A unique identifier for each student.
- `name`: The student's name.
- `age`: The student's age.
- `persona_id`: Refers to the student's persona (if any).
- `state_id`: Refers to the student's emotional state (if any).
- `style_id`: Refers to the student's learning style (if any).

**Example:**

```sql
INSERT INTO students (name, age) VALUES
('Alice', 11),
('Bob', 12);
```

### 8. Student Progress

Tracks the progress of individual students within specific skills.

- `progress_id`: A unique identifier for each progress record.
- `student_id`: Refers to the related student.
- `year_id`: Refers to the related year group.
- `category_id`: Refers to the related skill category (if any).
- `skill_id`: Refers to the related specific skill (if any).
- `SmartScore`: The student's SmartScore for the related skill.

**Example:**

```sql
INSERT INTO student_progress (student_id, year_id, category_id, skill_id, SmartScore) VALUES
(1, 3, 1, 1, 85),
(2, 3, 1, 2, 90);
```

### 9. Student Persona

Defines different student personas, representing typical behavioral patterns or learning needs.

- `persona_id`: A unique identifier for each persona.
- `name`: The name of the persona.
- `description`: A brief description of the persona.

**Example:**

```sql
INSERT INTO student_persona (name, description) VALUES
('Visual Learner', 'Learns best through visual aids');
```

### 10. Emotional States

Represents various emotional states that might affect a student's learning.

- `state_id`: A unique identifier for each state.
- `name`: The name of the state.
- `description`: A brief description of the

 state.

**Example:**

```sql
INSERT INTO emotional_states (name, description) VALUES
('Happy', 'Content and motivated'),
('Frustrated', 'Struggling with a concept');
```

### 11. Learning Styles

Defines different learning styles, representing how a student learns best.

- `style_id`: A unique identifier for each learning style.
- `name`: The name of the learning style.
- `description`: A brief description of the learning style.

**Example:**

```sql
INSERT INTO learning_styles (name, description) VALUES
('Visual', 'Prefers visual aids'),
('Auditory', 'Prefers auditory explanations');
```

### 12. Questions

Defines questions that are used to assess students' understanding of specific skills.

- `question_id`: A unique identifier for each question.
- `skill_id`: Refers to the related specific skill.
- `difficulty_level`: The difficulty level of the question (e.g., 1 to 5).
- `text`: The text of the question.

**Example:**

```sql
INSERT INTO questions (skill_id, difficulty_level, text) VALUES
(1, 2, 'Round 123 to the nearest tens'),
(2, 3, 'Convert 14 to Roman numerals');
```

### 13. Student Answers

Holds the students' answers to the questions.

- `answer_id`: A unique identifier for each answer.
- `question_id`: Refers to the related question.
- `student_id`: Refers to the related student.
- `correct`: Indicates whether the answer is correct.
- `response_time`: The time taken to answer the question.

**Example:**

```sql
INSERT INTO student_answers (question_id, student_id, correct, response_time) VALUES
(1, 1, true, '00:01:00'),
(2, 2, false, '00:02:00');
```

### 14. Student Collaboration

Tracks students' collaboration on projects or activities, rewarding them with collaboration points.

- `collaboration_id`: A unique identifier for each collaboration.
- `student_id`: Refers to the related student.
- `description`: A brief description of the collaboration.
- `points`: The points awarded for the collaboration.

**Example:**

```sql
INSERT INTO student_collaboration (student_id, description, points) VALUES
(1, 'Worked on a team project', 5);
```

### 15. Skill Relationships

Defines relationships between different skills, e.g., one skill may be a prerequisite for another.

- `relationship_id`: A unique identifier for each relationship.
- `skill_id_1`: Refers to the first related skill.
- `skill_id_2`: Refers to the second related skill.
- `relationship_type`: The type of relationship (e.g., 'prerequisite').

**Example:**

```sql
INSERT INTO skill_relationships (skill_id_1, skill_id_2, relationship_type) VALUES
(1, 2, 'prerequisite');
```

### Relationships and Algorithm Interaction

1. **Student Progress and Personalization**: The tables `students`, `student_persona`, `emotional_states`, and `learning_styles` work together to provide a personalized learning experience. The algorithm can consider these aspects to tailor the learning path.
2. **Skills Management**: The tables `subjects`, `skill_categories`, `specific_skills`, and `skill_relationships` are interrelated and allow the system to define and manage the hierarchy of learning skills and their relationships.
3. **Assessment and Collaboration**: The tables `questions`, `student_answers`, and `student_collaboration` are involved in assessing students' understanding and encouraging collaboration. The algorithm can use this information for scoring and identifying areas for improvement.
4. **Curriculum Management**: The tables `curriculum_stages`, `school_years`, and `year_subject_curriculum` enable the system to define and manage the overall curriculum structure, aligning it with various subjects and year groups.

By linking all these aspects, the schema provides a comprehensive and flexible foundation for a modern, personalized educational system that can adapt to individual student needs, track progress, and foster collaboration.
