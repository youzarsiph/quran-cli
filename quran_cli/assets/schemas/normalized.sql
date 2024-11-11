BEGIN;
--
-- Create model Ayah
--
DROP TABLE IF EXISTS "ayah";
CREATE TABLE "ayah" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "number" integer NOT NULL, "content" varchar(1024) NOT NULL, "hizb_id" bigint NULL REFERENCES "hizb" ("id") DEFERRABLE INITIALLY DEFERRED, "juz_id" bigint NULL REFERENCES "juz" ("id") DEFERRABLE INITIALLY DEFERRED, "quarter_id" bigint NULL REFERENCES "quarter" ("id") DEFERRABLE INITIALLY DEFERRED, "safhah_id" bigint NULL REFERENCES "safhah" ("id") DEFERRABLE INITIALLY DEFERRED, "sura_id" bigint NULL REFERENCES "sura" ("id") DEFERRABLE INITIALLY DEFERRED);
DROP INDEX IF EXISTS "ayah_sura_id_number_516977b2_uniq";
CREATE UNIQUE INDEX "ayah_sura_id_number_516977b2_uniq" ON "ayah" ("sura_id", "number");
DROP INDEX IF EXISTS "ayah_number_01925eb8";
CREATE INDEX "ayah_number_01925eb8" ON "ayah" ("number");
DROP INDEX IF EXISTS "ayah_content_21d8d4ad";
CREATE INDEX "ayah_content_21d8d4ad" ON "ayah" ("content");
DROP INDEX IF EXISTS "ayah_hizb_id_18b9671f";
CREATE INDEX "ayah_hizb_id_18b9671f" ON "ayah" ("hizb_id");
DROP INDEX IF EXISTS "ayah_juz_id_33ca7a74";
CREATE INDEX "ayah_juz_id_33ca7a74" ON "ayah" ("juz_id");
DROP INDEX IF EXISTS "ayah_quarter_id_f5d17d59";
CREATE INDEX "ayah_quarter_id_f5d17d59" ON "ayah" ("quarter_id");
DROP INDEX IF EXISTS "ayah_safhah_id_3e78c45c";
CREATE INDEX "ayah_safhah_id_3e78c45c" ON "ayah" ("safhah_id");
DROP INDEX IF EXISTS "ayah_sura_id_ada9f3e1";
CREATE INDEX "ayah_sura_id_ada9f3e1" ON "ayah" ("sura_id");
COMMIT;
BEGIN;
--
-- Create model Hizb
--
DROP TABLE IF EXISTS "hizb";
CREATE TABLE "hizb" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "hizb_verse_count_13a4ad1c";
CREATE INDEX "hizb_verse_count_13a4ad1c" ON "hizb" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Juz
--
DROP TABLE IF EXISTS "juz";
CREATE TABLE "juz" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "juz_verse_count_a4d50aaa";
CREATE INDEX "juz_verse_count_a4d50aaa" ON "juz" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Quarter
--
DROP TABLE IF EXISTS "quarter";
CREATE TABLE "quarter" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "quarter_verse_count_ee2d5b10";
CREATE INDEX "quarter_verse_count_ee2d5b10" ON "quarter" ("verse_count");
COMMIT;
BEGIN;
--
-- Create model Safhah
--
DROP TABLE IF EXISTS "safhah";
CREATE TABLE "safhah" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(32) NOT NULL UNIQUE, "verse_count" integer NOT NULL DEFAULT 1, "hizb_id" bigint NULL REFERENCES "hizb" ("id") DEFERRABLE INITIALLY DEFERRED, "juz_id" bigint NULL REFERENCES "juz" ("id") DEFERRABLE INITIALLY DEFERRED, "quarter_id" bigint NULL REFERENCES "quarter" ("id") DEFERRABLE INITIALLY DEFERRED, "sura_id" bigint NULL REFERENCES "sura" ("id") DEFERRABLE INITIALLY DEFERRED);
DROP INDEX IF EXISTS "safhah_verse_count_d1e33b86";
CREATE INDEX "safhah_verse_count_d1e33b86" ON "safhah" ("verse_count");
DROP INDEX IF EXISTS "safhah_hizb_id_aaff4645";
CREATE INDEX "safhah_hizb_id_aaff4645" ON "safhah" ("hizb_id");
DROP INDEX IF EXISTS "safhah_juz_id_c111e7dd";
CREATE INDEX "safhah_juz_id_c111e7dd" ON "safhah" ("juz_id");
DROP INDEX IF EXISTS "safhah_quarter_id_0b7b6698";
CREATE INDEX "safhah_quarter_id_0b7b6698" ON "safhah" ("quarter_id");
DROP INDEX IF EXISTS "safhah_sura_id_69cab5b1";
CREATE INDEX "safhah_sura_id_69cab5b1" ON "safhah" ("sura_id");
COMMIT;
BEGIN;
--
-- Create model Sura
--
DROP TABLE IF EXISTS "sura";
CREATE TABLE "sura" ("id" integer NOT NULL PRIMARY KEY AUTOINCREMENT, "name" varchar(16) NOT NULL UNIQUE, "order" integer NOT NULL UNIQUE, "type" bool NOT NULL, "verse_count" integer NOT NULL DEFAULT 1);
DROP INDEX IF EXISTS "sura_verse_count_de8cf9d1";
CREATE INDEX "sura_verse_count_de8cf9d1" ON "sura" ("verse_count");
COMMIT;
