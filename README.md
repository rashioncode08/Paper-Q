# Paper-Q – Question Paper Portal

Paper-Q is a question paper management portal developed as part of our Database Management Systems (DBMS) project.

## Features
- Browse question papers.
- View questions and their sub-parts.
- Access papers online.
- Download question paper PDFs.
- Organize papers by institute, course and subject.

## Technology Stack

**Frontend:** Next.js, React, TypeScript

**Backend:** Next.js API Routes, Node.js

**Database:** MySQL

**Database Connector:** mysql2

## Project Structure

- `database/` – SQL scripts and database setup instructions.
- `paper-portal/` – Next.js application, API routes and PDF files.

## Setup Instructions

1. Install Node.js and MySQL.
2. Import the SQL scripts from the `database/` folder into MySQL Workbench.
3. Navigate to `paper-portal/`.
4. Install dependencies:

   `npm install`

5. Create `.env.local` using the variables provided in `.env.example`.
6. Start the development server:

   `npm run dev`

7. Open `http://localhost:3000`.

## Team Project

Developed as part of the DBMS project at JK Lakshmipat University.

