-- Add tracking columns to the tables in the trace schema
ALTER TABLE trace.comments ADD COLUMN IF NOT EXISTS embedding_needed BOOLEAN DEFAULT TRUE;
ALTER TABLE trace.ratings ADD COLUMN IF NOT EXISTS embedding_needed BOOLEAN DEFAULT TRUE;
ALTER TABLE trace.instructors ADD COLUMN IF NOT EXISTS embedding_needed BOOLEAN DEFAULT TRUE;
ALTER TABLE trace.courses ADD COLUMN IF NOT EXISTS embedding_needed BOOLEAN DEFAULT TRUE;