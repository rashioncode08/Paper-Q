
import { NextResponse } from "next/server";
import db from "@/lib/db";

type Question = {
  Paper_ID: number;
  Question_Number: number;
  Question_Text: string;
  Marks: string | number;
  Difficulty_Level: string | null;
  subParts?: SubPart[];
};

type SubPart = {
  Paper_ID: number;
  Question_Number: number;
  Sub_Part_Number: string;
  Sub_Part_Text: string;
  Marks: string | number;
};

export async function GET(
  request: Request,
  context: { params: Promise<{ id: string }> }
) {
  try {
    const { id } = await context.params;
    const paperId = Number(id);

    if (!Number.isInteger(paperId) || paperId < 1) {
      return NextResponse.json(
        { success: false, message: "Invalid paper ID." },
        { status: 400 }
      );
    }

    const [questionRows] = await db.execute(
      `SELECT Paper_ID, Question_Number, Question_Text,
              Marks, Difficulty_Level
       FROM QUESTION
       WHERE Paper_ID = ?
       ORDER BY Question_Number`,
      [paperId]
    );

    const [subPartRows] = await db.execute(
      `SELECT Paper_ID, Question_Number, Sub_Part_Number,
              Sub_Part_Text, Marks
       FROM SUB_PART
       WHERE Paper_ID = ?
       ORDER BY Question_Number, Sub_Part_Number`,
      [paperId]
    );

    const questions = questionRows as Question[];
    const subParts = subPartRows as SubPart[];

    const result = questions.map((question) => ({
      ...question,
      subParts: subParts.filter(
        (part) =>
          part.Paper_ID === question.Paper_ID &&
          part.Question_Number === question.Question_Number
      ),
    }));

    return NextResponse.json({
      success: true,
      paperId,
      count: result.length,
      questions: result,
    });
  } catch (error) {
    console.error("Failed to fetch questions:", error);

    return NextResponse.json(
      { success: false, message: "Failed to fetch questions." },
      { status: 500 }
    );
  }
}
