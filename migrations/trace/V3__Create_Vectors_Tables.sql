CREATE SCHEMA IF NOT EXISTS vectors;

-- Enable pgvector extension
CREATE EXTENSION vector WITH SCHEMA public;

-- Create embedding tables in trace schema
CREATE TABLE IF NOT EXISTS vectors.comment_embeddings (
    id SERIAL PRIMARY KEY,
    comment_id INTEGER NOT NULL REFERENCES trace.comments(id) ON DELETE CASCADE,
    embedding vector(384),  -- 384 dimensions for all-MiniLM-L6-v2
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_comment_embedding UNIQUE (comment_id)
);

CREATE TABLE IF NOT EXISTS vectors.rating_embeddings (
    id SERIAL PRIMARY KEY,
    rating_id INTEGER NOT NULL REFERENCES trace.ratings(id) ON DELETE CASCADE,
    embedding vector(384),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_rating_embedding UNIQUE (rating_id)
);

CREATE TABLE IF NOT EXISTS vectors.instructor_embeddings (
    id SERIAL PRIMARY KEY,
    instructor_id INTEGER NOT NULL REFERENCES trace.instructors(id) ON DELETE CASCADE,
    embedding vector(384),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_instructor_embedding UNIQUE (instructor_id)
);

CREATE TABLE IF NOT EXISTS vectors.course_embeddings (
    id SERIAL PRIMARY KEY,
    course_id INTEGER NOT NULL REFERENCES trace.courses(id) ON DELETE CASCADE,
    embedding vector(384),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT uc_course_embedding UNIQUE (course_id)
);

-- Create vector similarity search indexes
CREATE INDEX IF NOT EXISTS idx_comment_embeddings ON vectors.comment_embeddings USING hnsw (embedding vector_cosine_ops);
CREATE INDEX IF NOT EXISTS idx_rating_embeddings ON vectors.rating_embeddings USING hnsw (embedding vector_cosine_ops);
CREATE INDEX IF NOT EXISTS idx_instructor_embeddings ON vectors.instructor_embeddings USING hnsw (embedding vector_cosine_ops);
CREATE INDEX IF NOT EXISTS idx_course_embeddings ON vectors.course_embeddings USING hnsw (embedding vector_cosine_ops);