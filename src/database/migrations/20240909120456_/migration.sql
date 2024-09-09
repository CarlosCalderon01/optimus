-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_business_statuses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_business_statuses" ("description", "id", "name") SELECT "description", "id", "name" FROM "business_statuses";
DROP TABLE "business_statuses";
ALTER TABLE "new_business_statuses" RENAME TO "business_statuses";
CREATE UNIQUE INDEX "business_statuses_name_key" ON "business_statuses"("name");
CREATE TABLE "new_cities" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "state_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "cities_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_cities" ("id", "name", "state_id") SELECT "id", "name", "state_id" FROM "cities";
DROP TABLE "cities";
ALTER TABLE "new_cities" RENAME TO "cities";
CREATE TABLE "new_countries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "iso3166_2" TEXT NOT NULL,
    "iso3166_3" TEXT NOT NULL,
    "num_code" INTEGER NOT NULL,
    "phone_code" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_countries" ("id", "iso3166_2", "iso3166_3", "name", "num_code", "phone_code") SELECT "id", "iso3166_2", "iso3166_3", "name", "num_code", "phone_code" FROM "countries";
DROP TABLE "countries";
ALTER TABLE "new_countries" RENAME TO "countries";
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_1" ON "countries"("name");
Pragma writable_schema=0;
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_2" ON "countries"("iso3166_2");
Pragma writable_schema=0;
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_3" ON "countries"("iso3166_3");
Pragma writable_schema=0;
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_4" ON "countries"("num_code");
Pragma writable_schema=0;
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_5" ON "countries"("phone_code");
Pragma writable_schema=0;
CREATE TABLE "new_genders" (
    "id" BOOLEAN NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL DEFAULT '',
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_genders" ("id", "name", "short_name") SELECT "id", "name", "short_name" FROM "genders";
DROP TABLE "genders";
ALTER TABLE "new_genders" RENAME TO "genders";
CREATE TABLE "new_genders_by_languages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER NOT NULL,
    "genders_id" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "genders_by_languages_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "genders_by_languages_genders_id_fkey" FOREIGN KEY ("genders_id") REFERENCES "genders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_genders_by_languages" ("genders_id", "id", "language_id", "name", "short_name") SELECT "genders_id", "id", "language_id", "name", "short_name" FROM "genders_by_languages";
DROP TABLE "genders_by_languages";
ALTER TABLE "new_genders_by_languages" RENAME TO "genders_by_languages";
CREATE INDEX "idx_genders_by_languages_language_id" ON "genders_by_languages"("language_id");
CREATE TABLE "new_holidays_by_countries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "holiday_date" DATETIME NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "holidays_by_countries_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_holidays_by_countries" ("country_id", "description", "holiday_date", "id", "title") SELECT "country_id", "description", "holiday_date", "id", "title" FROM "holidays_by_countries";
DROP TABLE "holidays_by_countries";
ALTER TABLE "new_holidays_by_countries" RENAME TO "holidays_by_countries";
CREATE INDEX "idx_holidays_by_country" ON "holidays_by_countries"("country_id");
CREATE TABLE "new_languages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "iso639_1" TEXT NOT NULL,
    "iso639_2" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_languages" ("id", "iso639_1", "iso639_2", "name") SELECT "id", "iso639_1", "iso639_2", "name" FROM "languages";
DROP TABLE "languages";
ALTER TABLE "new_languages" RENAME TO "languages";
CREATE UNIQUE INDEX "languages_name_key" ON "languages"("name");
CREATE UNIQUE INDEX "languages_iso639_1_key" ON "languages"("iso639_1");
CREATE UNIQUE INDEX "languages_iso639_2_key" ON "languages"("iso639_2");
CREATE TABLE "new_states" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "states_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_states" ("country_id", "id", "name") SELECT "country_id", "id", "name" FROM "states";
DROP TABLE "states";
ALTER TABLE "new_states" RENAME TO "states";
CREATE TABLE "new_type_documents" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "type_documents_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_type_documents" ("country_id", "id", "name") SELECT "country_id", "id", "name" FROM "type_documents";
DROP TABLE "type_documents";
ALTER TABLE "new_type_documents" RENAME TO "type_documents";
CREATE INDEX "idx_type_document_name" ON "type_documents"("name");
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;
