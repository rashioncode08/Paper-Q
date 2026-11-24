
import { NextResponse } from "next/server";
import db from "@/lib/db";

export async function GET() {
  try {
    const [rows] = await db.query(`
      SELECT
        qp.Paper_ID,
        qp.Academic_Year,
        qp.Semester,
        qp.Examination_Type,
        qp.Examination_Date,
        qp.Maximum_Marks,
        qp.Duration,
        qp.PDF_URL,
        s.Subject_Code,
        s.Subject_Name,
        c.Course_Name,
        i.Institute_Name
      FROM QUESTION_PAPER AS qp
      JOIN SUBJECT AS s
        ON qp.Subject_Code = s.Subject_Code
      JOIN COURSE AS c
        ON qp.Course_ID = c.Course_ID
      JOIN INSTITUTE AS i
        ON c.Institute_ID = i.Institute_ID
      ORDER BY qp.Academic_Year DESC, s.Subject_Name ASC
    `);

    return NextResponse.json({
      success: true,
      count: (rows as unknown[]).length,
      papers: rows,
    });
  } catch (error) {
    console.error("Failed to fetch papers:", error);

    return NextResponse.json(
      {
        success: false,
         message:
        error instanceof Error
          ? error.message
          : "Unknown database error",
      },
      { status: 500 }
    );
  }
}
