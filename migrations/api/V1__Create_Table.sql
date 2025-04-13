CREATE SCHEMA IF NOT EXISTS api;

-- Create users table
CREATE TABLE IF NOT EXISTS api.users (
    user_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    first_name VARCHAR(255) NOT NULL,
    last_name VARCHAR(255) NOT NULL,
    username VARCHAR(255) UNIQUE NOT NULL,
    password TEXT NOT NULL,
    account_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    account_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create health_checks table
CREATE TABLE IF NOT EXISTS api.health_checks (
    id SERIAL PRIMARY KEY,
    checked_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create instructors table
CREATE TABLE IF NOT EXISTS api.instructors (
    instructor_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    name VARCHAR(255) NOT NULL,
    date_created TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES api.users(user_id) ON DELETE CASCADE
);

-- Create schools table
CREATE SEQUENCE IF NOT EXISTS api.school_id_seq START 100;

CREATE TABLE IF NOT EXISTS api.schools (
    school_id INT PRIMARY KEY DEFAULT nextval('api.school_id_seq'),
    name TEXT UNIQUE NOT NULL
);

-- Create departments table
CREATE SEQUENCE IF NOT EXISTS api.department_id_seq START 1000;

CREATE TABLE IF NOT EXISTS api.departments (
    department_id INT PRIMARY KEY DEFAULT nextval('api.department_id_seq'),
    name TEXT UNIQUE NOT NULL,
    school_id INT NOT NULL,
    CONSTRAINT fk_school FOREIGN KEY (school_id) REFERENCES api.schools(school_id) ON DELETE CASCADE
);

-- Create courses table
CREATE TABLE IF NOT EXISTS api.courses (
    course_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    date_added TIMESTAMP NOT NULL DEFAULT NOW(),
    date_last_updated TIMESTAMP NOT NULL DEFAULT NOW(),
    user_id UUID NOT NULL,
    code VARCHAR(50) UNIQUE NOT NULL,
    name VARCHAR(255) NOT NULL,
    description TEXT,
    instructor_id UUID NOT NULL,
    department_id INT NOT NULL,  
    credit_hours INT NOT NULL CHECK (credit_hours >= 0),
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES api.users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES api.instructors(instructor_id) ON DELETE SET NULL,
    CONSTRAINT fk_department FOREIGN KEY (department_id) REFERENCES api.departments(department_id) ON DELETE CASCADE
);

-- Create semesters table
CREATE TABLE IF NOT EXISTS api.semester_terms (
    semester_term VARCHAR(20) PRIMARY KEY,  -- Example: "SP24", "FA24", "SU1_24"
    name VARCHAR(50) NOT NULL               -- Example: "Spring 2024", "Fall 2024"
);

-- Create traces table
CREATE TABLE IF NOT EXISTS api.traces (
    trace_id UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    user_id UUID NOT NULL,
    file_name     VARCHAR(255) NOT NULL,     -- File name
    date_created  TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- Auto set timestamp
    bucket_path   VARCHAR(255) NOT NULL,     -- Cloud storage path
    course_id UUID NOT NULL,
    instructor_id UUID NOT NULL,
    semester_term VARCHAR(20) NOT NULL,     
    section       VARCHAR(50) NOT NULL,      -- Course section
    
    CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES api.users(user_id) ON DELETE CASCADE,
    CONSTRAINT fk_instructor FOREIGN KEY (instructor_id) REFERENCES api.instructors(instructor_id) ON DELETE SET NULL,
    CONSTRAINT fk_course FOREIGN KEY (course_id) REFERENCES api.courses(course_id) ON DELETE CASCADE,
    CONSTRAINT fk_semester FOREIGN KEY (semester_term) REFERENCES api.semester_terms(semester_term) ON DELETE CASCADE
);
