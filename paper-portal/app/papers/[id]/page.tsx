export const dynamic = "force-dynamic";
import Link from "next/link";
import db from "@/lib/db";
import { notFound } from "next/navigation";

type SubPart = {
  Sub_Part_Number: string;
  Sub_Part_Text: string;
  Marks: string | number;
};

type Question = {
  Paper_ID: number;
  Question_Number: number;
  Question_Text: string;
  Marks: string | number;
  Difficulty_Level: string | null;
  subParts: SubPart[];
};

type Paper = {
  Paper_ID: number;
  Academic_Year: string;
  Semester: string;
  Examination_Type: string;
  Maximum_Marks: string | number;
  Duration: number;
  Subject_Code: string;
  Subject_Name: string;
  Course_Name: string;
};

export default async function PaperQuestionsPage({
  params,
}: {
  params: Promise<{ id: string }>;
}) {
  const { id } = await params;
  const paperId = Number(id);

  if (!Number.isInteger(paperId) || paperId < 1) {
    notFound();
  }

  let paper: Paper | undefined;
  let questions: Question[] = [];

  try {
    const [paperRows] = await db.execute(
      `SELECT qp.Paper_ID, qp.Academic_Year, qp.Semester,
              qp.Examination_Type, qp.Maximum_Marks, qp.Duration,
              s.Subject_Code, s.Subject_Name, c.Course_Name
       FROM QUESTION_PAPER qp
       JOIN SUBJECT s ON qp.Subject_Code = s.Subject_Code
       JOIN COURSE c ON qp.Course_ID = c.Course_ID
       WHERE qp.Paper_ID = ?`,
      [paperId]
    );

    paper = (paperRows as Paper[])[0];

    if (!paper) {
      notFound();
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

    const rawQuestions = questionRows as Omit<Question, "subParts">[];
    const subParts = subPartRows as (SubPart & {
      Paper_ID: number;
      Question_Number: number;
    })[];

    questions = rawQuestions.map((question) => ({
      ...question,
      subParts: subParts.filter(
        (part) =>
          part.Paper_ID === question.Paper_ID &&
          part.Question_Number === question.Question_Number
      ),
    }));
  } catch (error) {
    console.error("Unable to load paper:", error);
    throw error;
  }

  return (
    <main className="min-h-screen bg-slate-50 px-5 py-10 text-slate-900">
      <div className="mx-auto max-w-4xl">
        <Link
          href="/"
          className="font-semibold text-indigo-600 hover:underline"
        >
          ← Back to all papers
        </Link>

        <header className="mb-8 mt-6 rounded-2xl bg-indigo-950 p-7 text-white">
          <p className="text-sm font-semibold text-indigo-300">
            {paper.Subject_Code} · {paper.Course_Name}
          </p>
          <h1 className="mt-3 text-3xl font-black">
            {paper.Subject_Name}
          </h1>
          <p className="mt-3 text-indigo-100">
            {paper.Academic_Year} · Semester {paper.Semester}
          </p>
          <p className="mt-2 text-sm text-indigo-200">
            {paper.Examination_Type} · {paper.Maximum_Marks} marks ·{" "}
            {paper.Duration} minutes
          </p>
        </header>

        <h2 className="mb-5 text-2xl font-bold">Questions</h2>

        {questions.length === 0 ? (
          <div className="rounded-xl border bg-white p-6">
            No questions are stored for this paper yet.
          </div>
        ) : (
          <div className="space-y-5">
            {questions.map((question) => (
              <article
                key={`${question.Paper_ID}-${question.Question_Number}`}
                className="rounded-xl border border-slate-200 bg-white p-6 shadow-sm"
              >
                <div className="flex items-start justify-between gap-4">
                  <h3 className="font-bold">
                    Question {question.Question_Number}
                  </h3>
                  <span className="shrink-0 rounded-full bg-indigo-50 px-3 py-1 text-sm font-semibold text-indigo-700">
                    {question.Marks} marks
                  </span>
                </div>

                <p className="mt-4 whitespace-pre-wrap leading-7 text-slate-700">
                  {question.Question_Text}
                </p>

                {question.subParts.map((part) => (
                  <div
                    key={part.Sub_Part_Number}
                    className="mt-5 border-l-2 border-indigo-200 pl-4"
                  >
                    <div className="flex justify-between gap-3">
                      <h4 className="font-semibold">
                        Part ({part.Sub_Part_Number})
                      </h4>
                      <span className="text-sm text-slate-500">
                        {part.Marks} marks
                      </span>
                    </div>
                    <p className="mt-2 whitespace-pre-wrap leading-7 text-slate-600">
                      {part.Sub_Part_Text}
                    </p>
                  </div>
                ))}
              </article>
            ))}
          </div>
        )}
      </div>
    </main>
  );
}
