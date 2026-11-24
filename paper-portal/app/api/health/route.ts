
import { NextResponse } from "next/server";
import db from "@/lib/db";

export async function GET() {
  try {
    const [rows] = await db.query(
      "SELECT DATABASE() AS databaseName"
    );

    const result = rows as { databaseName: string }[];

    return NextResponse.json({
      status: "ok",
      database: result[0].databaseName,
      connected: true,
    });
  } catch (error) {
    console.error("Database connection failed:", error);

    return NextResponse.json(
      {
        status: "error",
        message: "Database connection failed",
      },
      { status: 500 }
    );
  }
}
