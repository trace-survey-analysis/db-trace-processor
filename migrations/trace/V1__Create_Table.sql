CREATE SCHEMA IF NOT EXISTS trace;

-- Create courses table
CREATE TABLE IF NOT EXISTS trace.courses (
    id SERIAL PRIMARY KEY,
    course_id VARCHAR(50) NOT NULL,
    course_name VARCHAR(255) NOT NULL,
    subject VARCHAR(50) NOT NULL,
    catalog_section VARCHAR(50) NOT NULL,
    semester VARCHAR(50) NOT NULL,
    year INTEGER NOT NULL,
    enrollment INTEGER NOT NULL,
    responses INTEGER NOT NULL,
    declines INTEGER NOT NULL,
    processed_at TIMESTAMP NOT NULL,
    original_file_name VARCHAR(255) NOT NULL,
    gcs_bucket VARCHAR(255) NOT NULL,
    gcs_path VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_course_semester_year UNIQUE (course_id, semester, year)
);

-- Create instructors table
CREATE TABLE IF NOT EXISTS trace.instructors (
    id SERIAL PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_instructor_name UNIQUE (name)
);

-- Create course_instructors join table
CREATE TABLE IF NOT EXISTS trace.course_instructors (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES trace.courses(id) ON DELETE CASCADE,
    instructor_id INTEGER NOT NULL REFERENCES trace.instructors(id) ON DELETE CASCADE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_course_instructor UNIQUE (course_id, instructor_id)
);

-- Create ratings table
CREATE TABLE IF NOT EXISTS trace.ratings (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES trace.courses(id) ON DELETE CASCADE,
    question_text TEXT NOT NULL,
    category VARCHAR(100) NOT NULL,
    responses INTEGER NOT NULL,
    response_rate DECIMAL(5,4) NOT NULL,
    course_mean DECIMAL(5,4) NOT NULL,
    dept_mean DECIMAL(5,4) NOT NULL,
    univ_mean DECIMAL(5,4) NOT NULL,
    course_median DECIMAL(5,4) NOT NULL,
    dept_median DECIMAL(5,4) NOT NULL,
    univ_median DECIMAL(5,4) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create comments table 
CREATE TABLE IF NOT EXISTS trace.comments (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES trace.courses(id) ON DELETE CASCADE,
    category VARCHAR(100) NOT NULL,
    question_text TEXT NOT NULL,
    response_number INTEGER NOT NULL,
    comment_text TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create processed_traces table to track processed messages
CREATE TABLE IF NOT EXISTS trace.processed_traces (
    id SERIAL PRIMARY KEY,
    trace_id VARCHAR(100) NOT NULL UNIQUE,
    course_id INTEGER REFERENCES trace.courses(id),
    processed_at TIMESTAMP NOT NULL,
    status VARCHAR(50) NOT NULL, -- 'success', 'error', etc.
    error_message TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Create indices for performance
CREATE INDEX IF NOT EXISTS idx_courses_course_id ON trace.courses(course_id);
CREATE INDEX IF NOT EXISTS idx_ratings_course_id ON trace.ratings(course_id);
CREATE INDEX IF NOT EXISTS idx_comments_course_id ON trace.comments(course_id);
CREATE INDEX IF NOT EXISTS idx_processed_traces_trace_id ON trace.processed_traces(trace_id);
CREATE INDEX IF NOT EXISTS idx_instructors_name ON trace.instructors(name);
