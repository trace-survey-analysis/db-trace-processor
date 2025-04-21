-- Add schools
INSERT INTO api.schools (name) VALUES ('College of Computer Info Sci'); 
INSERT INTO api.schools (name) VALUES ('Bouve College of Hlth Sciences');
INSERT INTO api.schools (name) VALUES ('Mills College at Northeastern');
INSERT INTO api.schools (name) VALUES ('D''Amore-McKim School Business');
INSERT INTO api.schools (name) VALUES ('College of Science');
INSERT INTO api.schools (name) VALUES ('Coll of Soc Sci Humanities');
INSERT INTO api.schools (name) VALUES ('College of Engineering');
INSERT INTO api.schools (name) VALUES ('Coll of Professional Studies');
INSERT INTO api.schools (name) VALUES ('Coll of Arts, Media, and Design');
INSERT INTO api.schools (name) VALUES ('School of Law');


-- Add departments
-- College of Computer Info Sci
INSERT INTO api.departments (name, school_id) VALUES ('Computer Science', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Information Science', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Cybersecutity', 100);
INSERT INTO api.departments (name, school_id) VALUES ('Data Science', 100);
-- Bouve College of Hlth Sciences
INSERT INTO api.departments (name, school_id) VALUES ('Pharmacy  Health Systems Sci', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Comm Sciences  Disorders', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Public Health and Health Sci', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Health Sci - Interdisciplinary', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Health Informatics', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Medical Sciences', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Phys Therapy/Movemnt/Rehab Sci', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Applied Psychology', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Pharmaceutical Science', 101);
INSERT INTO api.departments (name, school_id) VALUES ('Nursing', 101);
-- Mills College at Northeastern
INSERT INTO api.departments (name, school_id) VALUES ('Interdisc Studies - Mills', 102);
-- D'Amore-McKim School Business
INSERT INTO api.departments (name, school_id) VALUES ('Management', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Management Information Systems', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Management Science', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Managerial Economics', 103);
INSERT INTO api.departments (name, school_id) VALUES ('International Bus  Strategy', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Entrepreneurship  Innovation', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Finance  Insurance', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Marketing', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Human Resources Management', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Supply Chain Management', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Business Administration', 103);
INSERT INTO api.departments (name, school_id) VALUES ('Accounting', 103);
-- College of Science
INSERT INTO api.departments (name, school_id) VALUES ('Physics', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Interdisc Studies - Science', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Marine  Environment Sciences', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Dean of College of Sciences', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Mathematics', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Psychology', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Chemistry  Chemical Biology', 104);
INSERT INTO api.departments (name, school_id) VALUES ('Biology', 104);
-- Coll of Soc Sci Humanities
INSERT INTO api.departments (name, school_id) VALUES ('Criminology  Criminal Justice', 105);
INSERT INTO api.departments (name, school_id) VALUES ('English', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Political Science', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Interdisc Studies - Soc Sc/Hum', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Cultures/Societies/Global Stds', 105);
INSERT INTO api.departments (name, school_id) VALUES ('International Affairs', 105);
INSERT INTO api.departments (name, school_id) VALUES ('World Languages Center', 105);
INSERT INTO api.departments (name, school_id) VALUES ('History', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Dean of Coll of Soc Sci  Huma', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Pub Policy and Urban Affairs', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Sociology and Anthropology', 105);
INSERT INTO api.departments (name, school_id) VALUES ('American Sign Language', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Philosophy and Religion', 105);
INSERT INTO api.departments (name, school_id) VALUES ('Economics', 105);
-- College of Engineering
INSERT INTO api.departments (name, school_id) VALUES ('Chemical Engineering', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Civil  Environmental Engineer', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Dean of Engineering', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Bioengineering', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Grad Engineering - Multidiscpl', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Electrical and Comp Engineerng', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Grad Engineering - Leadershipthing', 106);
INSERT INTO api.departments (name, school_id) VALUES ('Mech  Industrial Engineering', 106);
INSERT INTO api.departments (name, school_id) VALUES ('General Engineering', 106);
-- Coll of Professional Studies
INSERT INTO api.departments (name, school_id) VALUES ('Special Programs - Semester', 107);
INSERT INTO api.departments (name, school_id) VALUES ('Col of Professional Studies', 107);
INSERT INTO api.departments (name, school_id) VALUES ('Education', 107);
-- Coll of Arts, Media, and Design
INSERT INTO api.departments (name, school_id) VALUES ('Theatre', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Art and Design', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Music', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Communication Studies', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Journalism', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Architecture', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Interdisc Studies - Arts/Media', 108);
INSERT INTO api.departments (name, school_id) VALUES ('Dean of Coll of Arts, Media', 108);
-- School of Law
INSERT INTO api.departments (name, school_id) VALUES ('Law', 109);


-- Add semester_terms
INSERT INTO api.semester_terms (semester_term, name) VALUES ('FA21', 'Fall 2021');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP22', 'Spring 2022');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU1_22', 'Summer 1 2022');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU2_22', 'Summer 2 2022');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU22', 'Full Summer 2022');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('FA22', 'Fall 2022');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP23', 'Spring 2023');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU1_23', 'Summer 1 2023');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU2_23', 'Summer 2 2023');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU23', 'Full Summer 2023');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('FA23', 'Fall 2023');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP24', 'Spring 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('FA24', 'Fall 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU1_24', 'Summer 1 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU2_24', 'Summer 2 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SU24', 'Full Summer 2024');
INSERT INTO api.semester_terms (semester_term, name) VALUES ('SP25', 'Spring 2025');
