-- Add dummy data to schools
INSERT INTO api.schools (name) VALUES ('College of Engineering');
INSERT INTO api.schools (name) VALUES ('Bouve - Health Sciences');
INSERT INTO api.schools (name) VALUES ('College of Arts, Media, and Design');
INSERT INTO api.schools (name) VALUES ('DAmore-McKim School of Business');
INSERT INTO api.schools (name) VALUES ('College of Computer and Information Science');
INSERT INTO api.schools (name) VALUES ('College of Social Sciences and Humanities');
INSERT INTO api.schools (name) VALUES ('College of Professional Studies');
INSERT INTO api.schools (name) VALUES ('College of Science');


-- Add dummy data to departments
INSERT INTO api.departments (name, school_id) VALUES ('Computer Science', 100);
INSERT INTO api.departments (name, school_id) VALUES ('MGEN', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Electrical and Computer Engineering', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Mechanical and Industrial Engineering', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Chemical Engineering', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Bioengineering', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Civil and Environmental Engineering', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Health Sciences', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Media Arts', 102);
INSERT INTO api.departments (name, school_id) VALUES ('Design', 102);
INSERT INTO api.departments (name, school_id) VALUES ('Music', 102);
INSERT INTO api.departments (name, school_id) VALUES ('Business Administration', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Accounting', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Finance', 103);


-- Add dummy data to semester_terms
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP24', 'Spring 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('FA24', 'Fall 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU1_24', 'Summer 1 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU2_24', 'Summer 2 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU24', 'Full Summer 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP25', 'Spring 2025');
