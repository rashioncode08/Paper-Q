
"use client";

import { useEffect, useMemo, useState } from "react";

type Paper = {
  Paper_ID: number;
  Academic_Year: string;
  Semester: string;
  Examination_Type: string;
  Examination_Date: string | null;
  Maximum_Marks: string;
  Duration: number;
  PDF_URL: string | null;
  Subject_Code: string;
  Subject_Name: string;
  Course_Name: string;
  Institute_Name: string;
};

export default function Home() {
  const [papers, setPapers] = useState<Paper[]>([]);
  const [loading, setLoading] = useState(true);
  const [error, setError] = useState("");
  const [search, setSearch] = useState("");
  const [course, setCourse] = useState("All");
  const [semester, setSemester] = useState("All");

  useEffect(() => {
    async function loadPapers() {
      try {
        const response = await fetch("/api/papers");
        const data = await response.json();

        if (!response.ok || !data.success) {
          throw new Error(data.message || "Could not load papers.");
        }

        setPapers(data.papers);
      } catch (err) {
        setError(
          err instanceof Error ? err.message : "Something went wrong."
        );
      } finally {
        setLoading(false);
      }
    }

    loadPapers();
  }, []);

  const courses = useMemo(
    () => [...new Set(papers.map((paper) => paper.Course_Name))].sort(),
    [papers]
  );

  const semesters = useMemo(
    () => [...new Set(papers.map((paper) => paper.Semester))].sort(),
    [papers]
  );

  const filteredPapers = papers.filter((paper) => {
    const query = search.toLowerCase().trim();

    const matchesSearch = [
      paper.Subject_Name,
      paper.Subject_Code,
      paper.Course_Name,
      paper.Academic_Year,
      paper.Examination_Type,
    ].some((value) => value.toLowerCase().includes(query));

    return (
      matchesSearch &&
      (course === "All" || paper.Course_Name === course) &&
      (semester === "All" || paper.Semester === semester)
    );
  });

  return (
    <main className="min-h-screen bg-[#f7f8fc] text-slate-900">
      <header className="border-b border-slate-200 bg-white">
        <div className="mx-auto flex max-w-7xl items-center justify-between px-6 py-5">
          <a href="/" className="text-2xl font-black tracking-tight">
            Paper<span className="text-indigo-600">Q</span>
          </a>
          <span className="rounded-full bg-indigo-50 px-4 py-2 text-sm font-semibold text-indigo-700">
            Question Paper Library
          </span>
        </div>
      </header>

      <section className="bg-indigo-950 px-6 py-16 text-white sm:py-20">
        <div className="mx-auto max-w-7xl">
          <p className="mb-4 text-sm font-bold uppercase tracking-[0.2em] text-indigo-300">
            Your academic resource hub
          </p>
          <h1 className="max-w-3xl text-4xl font-black leading-tight sm:text-6xl">
            Find your next exam paper.
          </h1>
          <p className="mt-5 max-w-2xl text-base leading-7 text-indigo-100 sm:text-lg">
            Explore previous question papers by subject, course, and semester.
            Prepare smarter, one paper at a time.
          </p>

          <div className="mt-8 max-w-2xl">
            <label htmlFor="paper-search" className="sr-only">
              Search question papers
            </label>
            <input
              id="paper-search"
              value={search}
              onChange={(event) => setSearch(event.target.value)}
              placeholder="Search by subject, code, or exam type..."
              className="w-full rounded-xl border border-white/20 bg-white px-5 py-4 text-slate-900 outline-none placeholder:text-slate-400 focus:ring-4 focus:ring-indigo-300"
            />
          </div>
        </div>
      </section>

      <section className="mx-auto max-w-7xl px-6 py-10">
        <div className="mb-7 flex flex-col gap-4 sm:flex-row sm:items-end sm:justify-between">
          <div>
            <h2 className="text-2xl font-bold">Question papers</h2>
            <p className="mt-2 text-sm text-slate-500">
              Browse the papers currently available in the database.
            </p>
          </div>

          <div className="flex flex-wrap gap-3">
            <label className="text-sm text-slate-600">
              Course
              <select
                value={course}
                onChange={(event) => setCourse(event.target.value)}
                className="mt-1 block rounded-lg border border-slate-300 bg-white px-3 py-2"
              >
                <option value="All">All courses</option>
                {courses.map((item) => (
                  <option key={item} value={item}>
                    {item}
                  </option>
                ))}
              </select>
            </label>

            <label className="text-sm text-slate-600">
              Semester
              <select
                value={semester}
                onChange={(event) => setSemester(event.target.value)}
                className="mt-1 block max-w-48 rounded-lg border border-slate-300 bg-white px-3 py-2"
              >
                <option value="All">All semesters</option>
                {semesters.map((item) => (
                  <option key={item} value={item}>
                    {item}
                  </option>
                ))}
              </select>
            </label>
          </div>
        </div>

        {loading && (
          <p className="rounded-xl bg-white p-8 text-slate-600">
            Loading question papers...
          </p>
        )}

        {error && (
          <div className="rounded-xl border border-red-200 bg-red-50 p-5 text-red-700">
            {error}
          </div>
        )}

        {!loading && !error && (
          <>
            <p className="mb-5 text-sm text-slate-500">
              Showing {filteredPapers.length} of {papers.length} papers
            </p>

            {filteredPapers.length === 0 ? (
              <div className="rounded-xl border border-slate-200 bg-white p-10 text-center">
                <h3 className="text-lg font-bold">No papers found</h3>
                <p className="mt-2 text-slate-500">
                  Try another search or change the filters.
                </p>
              </div>
            ) : (
              <div className="grid gap-5 md:grid-cols-2 xl:grid-cols-3">
                {filteredPapers.map((paper) => (
                  <article
                    key={paper.Paper_ID}
                    className="flex flex-col rounded-2xl border border-slate-200 bg-white p-6 shadow-sm transition hover:-translate-y-1 hover:shadow-md"
                  >
                    <div className="flex items-start justify-between gap-3">
                      <span className="rounded-lg bg-indigo-50 px-3 py-1.5 text-xs font-bold text-indigo-700">
                        {paper.Subject_Code}
                      </span>
                      <span className="text-xs font-medium text-slate-500">
                        {paper.Academic_Year}
                      </span>
                    </div>

                    <h3 className="mt-5 text-xl font-bold leading-snug">
                      {paper.Subject_Name}
                    </h3>

                    <p className="mt-2 text-sm text-slate-500">
                      {paper.Institute_Name}
                    </p>

                    <div className="mt-5 grid grid-cols-2 gap-3 text-sm">
                      <div className="rounded-lg bg-slate-50 p-3">
                        <p className="text-slate-500">Course</p>
                        <p className="mt-1 font-semibold">
                          {paper.Course_Name}
                        </p>
                      </div>
                      <div className="rounded-lg bg-slate-50 p-3">
                        <p className="text-slate-500">Semester</p>
                        <p className="mt-1 font-semibold">
                          {paper.Semester}
                        </p>
                      </div>
                      <div className="rounded-lg bg-slate-50 p-3">
                        <p className="text-slate-500">Exam</p>
                        <p className="mt-1 font-semibold">
                          {paper.Examination_Type}
                        </p>
                      </div>
                      <div className="rounded-lg bg-slate-50 p-3">
                        <p className="text-slate-500">Marks / Duration</p>
                        <p className="mt-1 font-semibold">
                          {paper.Maximum_Marks} / {paper.Duration} min
                        </p>
                      </div>
                    </div>

                    <div className="mt-auto pt-6">
                      {paper.PDF_URL ? (
                        <div className="flex gap-3">
                          <a
                            href={paper.PDF_URL}
                            target="_blank"
                            rel="noreferrer"
                            className="flex-1 rounded-lg bg-indigo-600 px-3 py-3 text-center text-sm font-bold text-white hover:bg-indigo-700"
                          >
                            View PDF
                          </a>
                          <a
                            href={paper.PDF_URL}
                            download
                            className="flex-1 rounded-lg border border-indigo-200 px-3 py-3 text-center text-sm font-bold text-indigo-700 hover:bg-indigo-50"
                          >
                            Download
                          </a>
                        </div>
                      ) : (
                        <p className="rounded-lg bg-amber-50 px-4 py-3 text-center text-sm font-medium text-amber-800">
                          PDF not linked yet
                        </p>
                      )}
                    </div>
                    {/* View Questions Button */}
                    <a
                      href={`/papers/${paper.Paper_ID}`}
                      className="mt-4 block w-full rounded-lg bg-indigo-600 px-4 py-3 text-center text-sm font-bold text-white transition hover:bg-indigo-700"
                    >
                      View Questions
                    </a>
                  </article>
                ))}
              </div>
            )}
          </>
        )}
      </section>

      <footer className="border-t border-slate-200 bg-white px-6 py-6 text-center text-sm text-slate-500">
        PaperQ · Your question paper library
      </footer>
    </main>
  );
}
