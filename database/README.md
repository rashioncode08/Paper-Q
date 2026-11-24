# Paper-Q Database Setup

## Requirements
- MySQL 8.0 or later
- MySQL Workbench

## Setup Instructions

1. Open MySQL Workbench.
2. Open the SQL script `@script.sql`.
3. Execute it to create the database and tables.
4. Execute the remaining SQL scripts in the appropriate order to insert question paper data.
5. Verify that the database `paper_Q` contains all six tables:
   - INSTITUTE
   - COURSE
   - SUBJECT
   - QUESTION_PAPER
   - QUESTION
   - SUB_PART

6. Configure your local database credentials in the `.env.local` file of the Next.js application.

**Note:** Each developer must configure their own MySQL credentials.