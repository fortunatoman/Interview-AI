-- Fix duplicate foreign key constraint in ChatMessages table
-- This script removes the duplicate SessionId1 foreign key

-- Drop the duplicate foreign key constraint
ALTER TABLE "ChatMessages" DROP CONSTRAINT IF EXISTS "FK_ChatMessages_InterviewSessions_SessionId1";

-- Drop the duplicate column if it exists
ALTER TABLE "ChatMessages" DROP COLUMN IF EXISTS "SessionId1";

-- Ensure the correct foreign key constraint exists
ALTER TABLE "ChatMessages" ADD CONSTRAINT "FK_ChatMessages_InterviewSessions_SessionId" 
    FOREIGN KEY ("SessionId") REFERENCES "InterviewSessions" ("Id") ON DELETE CASCADE; 