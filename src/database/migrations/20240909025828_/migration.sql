-- CreateTable
CREATE TABLE "accounts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "type_document_id" INTEGER NOT NULL,
    "gender_id" BOOLEAN NOT NULL DEFAULT false,
    "country_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "num_id" TEXT NOT NULL,
    "nick_name" TEXT NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "birth_date" DATETIME,
    "home_address" TEXT,
    "postal_code" TEXT,
    "cell_phone" TEXT,
    "home_phone" TEXT,
    "verified_account" BOOLEAN NOT NULL DEFAULT false,
    "verified_user" BOOLEAN NOT NULL DEFAULT false,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "accounts_type_document_id_fkey" FOREIGN KEY ("type_document_id") REFERENCES "type_documents" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "accounts_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "accounts_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "accounts_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "accounts_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "businesses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "account_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "name" TEXT,
    "vision" TEXT,
    "mission" TEXT,
    "motto" TEXT,
    "postal_code" TEXT,
    "cell_phone" TEXT,
    "home_phone" TEXT,
    "tax_id" TEXT,
    "website_url" TEXT,
    "logo_url" TEXT,
    "open_hours" TEXT,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "businesses_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "businesses_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "businesses_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "businesses_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "businesses_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "business_statuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "business_statuses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT
);

-- CreateTable
CREATE TABLE "type_documents" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "type_documents_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "countries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "iso3166_2" TEXT NOT NULL,
    "iso3166_3" TEXT NOT NULL,
    "num_code" INTEGER NOT NULL,
    "phone_code" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "states" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "states_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "cities" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "state_id" INTEGER NOT NULL,
    "name" TEXT NOT NULL,
    CONSTRAINT "cities_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "genders" (
    "id" BOOLEAN NOT NULL PRIMARY KEY,
    "name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL DEFAULT ''
);

-- CreateTable
CREATE TABLE "genders_by_languages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "language_id" INTEGER NOT NULL,
    "genders_id" BOOLEAN NOT NULL,
    "name" TEXT NOT NULL,
    "short_name" TEXT NOT NULL,
    CONSTRAINT "genders_by_languages_language_id_fkey" FOREIGN KEY ("language_id") REFERENCES "languages" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "genders_by_languages_genders_id_fkey" FOREIGN KEY ("genders_id") REFERENCES "genders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "holidays_by_countries" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "country_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "description" TEXT NOT NULL,
    "holiday_date" DATETIME NOT NULL,
    CONSTRAINT "holidays_by_countries_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "languages" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "iso639_1" TEXT NOT NULL,
    "iso639_2" TEXT NOT NULL
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_accounts_1" ON "accounts"("email");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_accounts_2" ON "accounts"("num_id");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_accounts_3" ON "accounts"("nick_name");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "accounts_email_idx" ON "accounts"("email");

-- CreateIndex
CREATE INDEX "accounts_num_id_idx" ON "accounts"("num_id");

-- CreateIndex
CREATE INDEX "accounts_nick_name_idx" ON "accounts"("nick_name");

-- CreateIndex
CREATE UNIQUE INDEX "business_statuses_name_key" ON "business_statuses"("name");

-- CreateIndex
CREATE INDEX "idx_type_document_name" ON "type_documents"("name");

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_1" ON "countries"("name");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_2" ON "countries"("iso3166_2");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_3" ON "countries"("iso3166_3");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_4" ON "countries"("num_code");
Pragma writable_schema=0;

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_countries_5" ON "countries"("phone_code");
Pragma writable_schema=0;

-- CreateIndex
CREATE INDEX "idx_genders_by_languages_language_id" ON "genders_by_languages"("language_id");

-- CreateIndex
CREATE INDEX "idx_holidays_by_country" ON "holidays_by_countries"("country_id");

-- CreateIndex
CREATE UNIQUE INDEX "languages_name_key" ON "languages"("name");

-- CreateIndex
CREATE UNIQUE INDEX "languages_iso639_1_key" ON "languages"("iso639_1");

-- CreateIndex
CREATE UNIQUE INDEX "languages_iso639_2_key" ON "languages"("iso639_2");
