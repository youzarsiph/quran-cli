BEGIN;
--
-- Create model Verse
--
DROP TABLE IF EXISTS "verses";
CREATE TABLE "verses" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "number" integer NOT NULL, "content" varchar(1024) NOT NULL, "group_id" bigint NULL REFERENCES "groups" ("id") DEFERRABLE INITIALLY DEFERRED, "part_id" bigint NULL REFERENCES "parts" ("id") DEFERRABLE INITIALLY DEFERRED, "quarter_id" bigint NULL REFERENCES "quarters" ("id") DEFERRABLE INITIALLY DEFERRED, "page_id" bigint NULL REFERENCES "pages" ("id") DEFERRABLE INITIALLY DEFERRED, "chapter_id" bigint NULL REFERENCES "chapters" ("id") DEFERRABLE INITIALLY DEFERRED);
DROP INDEX IF EXISTS "verses_chapter_id_number_516977b2_uniq";
CREATE UNIQUE INDEX "verses_chapter_id_number_516977b2_uniq" ON "verses" ("chapter_id", "number");
DROP INDEX IF EXISTS "verses_number_01925eb8";
CREATE INDEX "verses_number_01925eb8" ON "verses" ("number");
DROP INDEX IF EXISTS "verses_content_21d8d4ad";
CREATE INDEX "verses_content_21d8d4ad" ON "verses" ("content");
DROP INDEX IF EXISTS "verses_group_id_18b9671f";
CREATE INDEX "verses_group_id_18b9671f" ON "verses" ("group_id");
DROP INDEX IF EXISTS "verses_part_id_33ca7a74";
CREATE INDEX "verses_part_id_33ca7a74" ON "verses" ("part_id");
DROP INDEX IF EXISTS "verses_quarter_id_f5d17d59";
CREATE INDEX "verses_quarter_id_f5d17d59" ON "verses" ("quarter_id");
DROP INDEX IF EXISTS "verses_page_id_3e78c45c";
CREATE INDEX "verses_page_id_3e78c45c" ON "verses" ("page_id");
DROP INDEX IF EXISTS "verses_chapter_id_ada9f3e1";
CREATE INDEX "verses_chapter_id_ada9f3e1" ON "verses" ("chapter_id");
COMMIT;
BEGIN;
--
-- Create model Group
--
DROP TABLE IF EXISTS "groups";
CREATE TABLE "groups" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "group_verse_count_13a4ad1c";
CREATE INDEX "group_verse_count_13a4ad1c" ON "groups" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Part
--
DROP TABLE IF EXISTS "parts";
CREATE TABLE "parts" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "part_verse_count_a4d50aaa";
CREATE INDEX "part_verse_count_a4d50aaa" ON "parts" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Quarter
--
DROP TABLE IF EXISTS "quarters";
CREATE TABLE "quarters" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "quarter_verse_count_ee2d5b10";
CREATE INDEX "quarter_verse_count_ee2d5b10" ON "quarters" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Page
--
DROP TABLE IF EXISTS "pages";
CREATE TABLE "pages" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1, "group_id" bigint NULL REFERENCES "groups" ("id") DEFERRABLE INITIALLY DEFERRED, "part_id" bigint NULL REFERENCES "parts" ("id") DEFERRABLE INITIALLY DEFERRED, "quarter_id" bigint NULL REFERENCES "quarters" ("id") DEFERRABLE INITIALLY DEFERRED, "chapter_id" bigint NULL REFERENCES "chapters" ("id") DEFERRABLE INITIALLY DEFERRED);
DROP INDEX IF EXISTS "page_verse_count_d1e33b86";
CREATE INDEX "page_verse_count_d1e33b86" ON "pages" ("verse_count");
DROP INDEX IF EXISTS "page_group_id_aaff4645";
CREATE INDEX "page_group_id_aaff4645" ON "pages" ("group_id");
DROP INDEX IF EXISTS "page_part_id_c111e7dd";
CREATE INDEX "page_part_id_c111e7dd" ON "pages" ("part_id");
DROP INDEX IF EXISTS "page_quarter_id_0b7b6698";
CREATE INDEX "page_quarter_id_0b7b6698" ON "pages" ("quarter_id");
DROP INDEX IF EXISTS "page_chapter_id_69cab5b1";
CREATE INDEX "page_chapter_id_69cab5b1" ON "pages" ("chapter_id");
COMMIT;
BEGIN;
--
-- Create model Chapter
--
DROP TABLE IF EXISTS "chapters";
CREATE TABLE "chapters" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(16) NOT NULL UNIQUE, "order" integer NOT NULL UNIQUE, "type" bool NOT NULL, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "chapter_verse_count_de8cf9d1";
CREATE INDEX "chapter_verse_count_de8cf9d1" ON "chapters" ("verse_count");
COMMIT;
