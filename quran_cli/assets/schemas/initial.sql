DROP TABLE IF EXISTS "quran";

CREATE TABLE "quran" (
  "id" INTEGER PRIMARY KEY AUTOINCREMENT,
  "chapter_id" INTEGER NOT NULL,
  "number" INTEGER NOT NULL,
  "content" TEXT NOT NULL
);