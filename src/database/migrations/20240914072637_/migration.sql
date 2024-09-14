/*
  Warnings:

  - You are about to drop the `appointment_statuses` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `appointments` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `customers` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the `genders_by_languages` table. If the table is not empty, all the data it contains will be lost.
  - You are about to drop the column `birth_date` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `cell_phone` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `city_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `country_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `first_name` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `gender_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `home_address` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `home_phone` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `last_name` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `nick_name` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `num_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `postal_code` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `state_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `type_document_id` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `verified_account` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `verified_user` on the `accounts` table. All the data in the column will be lost.
  - You are about to drop the column `cell_phone` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `city_id` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `country_id` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `home_phone` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `open_hours` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `postal_code` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `state_id` on the `businesses` table. All the data in the column will be lost.
  - You are about to drop the column `customer_id` on the `invoices` table. All the data in the column will be lost.
  - You are about to drop the column `country_id` on the `type_documents` table. All the data in the column will be lost.
  - Added the required column `client_id` to the `invoices` table without a default value. This is not possible if the table is not empty.

*/
-- DropIndex
DROP INDEX "appointment_statuses_name_key";

-- DropIndex
DROP INDEX "idx_genders_by_languages_language_id";

-- DropIndex
DROP INDEX "idx_holidays_by_country";

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "appointment_statuses";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "appointments";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "customers";
PRAGMA foreign_keys=on;

-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "genders_by_languages";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "clients" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "business_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "email" TEXT,
    "phone_number" TEXT,
    "address" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "clients_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "businesses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "reservation_statuses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);

-- CreateTable
CREATE TABLE "reservations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "business_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "title" TEXT NOT NULL,
    "service" TEXT NOT NULL,
    "observations" TEXT NOT NULL,
    "start_date" DATETIME NOT NULL,
    "end_date" DATETIME NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "reservations_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "businesses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "reservations_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "clients" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "reservations_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "reservation_statuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "business_locations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "business_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    "address" TEXT,
    "postal_code" TEXT,
    CONSTRAINT "business_locations_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "businesses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "business_locations_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "business_locations_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "business_locations_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "business_contacts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "business_id" INTEGER NOT NULL,
    "cell_phone" TEXT,
    "home_phone" TEXT,
    CONSTRAINT "business_contacts_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "businesses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "users" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "account_id" INTEGER NOT NULL,
    "gender_id" BOOLEAN NOT NULL,
    "type_documents_id" INTEGER NOT NULL,
    "first_name" TEXT NOT NULL,
    "last_name" TEXT NOT NULL,
    "birth_date" DATETIME NOT NULL,
    CONSTRAINT "users_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "users_gender_id_fkey" FOREIGN KEY ("gender_id") REFERENCES "genders" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "users_type_documents_id_fkey" FOREIGN KEY ("type_documents_id") REFERENCES "type_documents" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "user_locations" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "country_id" INTEGER NOT NULL,
    "state_id" INTEGER NOT NULL,
    "city_id" INTEGER NOT NULL,
    CONSTRAINT "user_locations_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "user_locations_country_id_fkey" FOREIGN KEY ("country_id") REFERENCES "countries" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "user_locations_state_id_fkey" FOREIGN KEY ("state_id") REFERENCES "states" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "user_locations_city_id_fkey" FOREIGN KEY ("city_id") REFERENCES "cities" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- CreateTable
CREATE TABLE "user_contacts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "user_id" INTEGER NOT NULL,
    "cell_phone" TEXT,
    "home_phone" TEXT,
    "postal_code" TEXT,
    CONSTRAINT "user_contacts_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "users" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);

-- RedefineTables
PRAGMA defer_foreign_keys=ON;
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_accounts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "is_email_verified" BOOLEAN NOT NULL DEFAULT false,
    "is_person_verified" BOOLEAN NOT NULL DEFAULT false,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_accounts" ("created_at", "email", "id", "password_hash", "updated_at") SELECT "created_at", "email", "id", "password_hash", "updated_at" FROM "accounts";
DROP TABLE "accounts";
ALTER TABLE "new_accounts" RENAME TO "accounts";
CREATE UNIQUE INDEX "accounts_email_key" ON "accounts"("email");
CREATE TABLE "new_businesses" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "account_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "name" TEXT,
    "vision" TEXT,
    "mission" TEXT,
    "motto" TEXT,
    "tax_id" TEXT,
    "website_url" TEXT,
    "logo_url" TEXT,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "businesses_account_id_fkey" FOREIGN KEY ("account_id") REFERENCES "accounts" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "businesses_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "business_statuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_businesses" ("account_id", "created_at", "id", "logo_url", "mission", "motto", "name", "status_id", "tax_id", "updated_at", "vision", "website_url") SELECT "account_id", "created_at", "id", "logo_url", "mission", "motto", "name", "status_id", "tax_id", "updated_at", "vision", "website_url" FROM "businesses";
DROP TABLE "businesses";
ALTER TABLE "new_businesses" RENAME TO "businesses";
CREATE UNIQUE INDEX "businesses_account_id_key" ON "businesses"("account_id");
CREATE TABLE "new_invoices" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "business_id" INTEGER NOT NULL,
    "client_id" INTEGER NOT NULL,
    "status_id" INTEGER NOT NULL,
    "issue_date" DATETIME NOT NULL,
    "due_date" DATETIME NOT NULL,
    "total_amount" REAL NOT NULL,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT "invoices_business_id_fkey" FOREIGN KEY ("business_id") REFERENCES "businesses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "invoices_client_id_fkey" FOREIGN KEY ("client_id") REFERENCES "clients" ("id") ON DELETE RESTRICT ON UPDATE CASCADE,
    CONSTRAINT "invoices_status_id_fkey" FOREIGN KEY ("status_id") REFERENCES "invoice_statuses" ("id") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_invoices" ("business_id", "created_at", "due_date", "id", "issue_date", "status_id", "total_amount", "updated_at") SELECT "business_id", "created_at", "due_date", "id", "issue_date", "status_id", "total_amount", "updated_at" FROM "invoices";
DROP TABLE "invoices";
ALTER TABLE "new_invoices" RENAME TO "invoices";
CREATE TABLE "new_type_documents" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "description" TEXT,
    "created_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
INSERT INTO "new_type_documents" ("created_at", "id", "name", "updated_at") SELECT "created_at", "id", "name", "updated_at" FROM "type_documents";
DROP TABLE "type_documents";
ALTER TABLE "new_type_documents" RENAME TO "type_documents";
PRAGMA foreign_keys=ON;
PRAGMA defer_foreign_keys=OFF;

-- CreateIndex
CREATE UNIQUE INDEX "reservation_statuses_name_key" ON "reservation_statuses"("name");

-- CreateIndex
CREATE UNIQUE INDEX "business_locations_business_id_key" ON "business_locations"("business_id");

-- CreateIndex
CREATE UNIQUE INDEX "business_contacts_business_id_key" ON "business_contacts"("business_id");

-- CreateIndex
CREATE UNIQUE INDEX "users_account_id_key" ON "users"("account_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_locations_user_id_key" ON "user_locations"("user_id");

-- CreateIndex
CREATE UNIQUE INDEX "user_contacts_user_id_key" ON "user_contacts"("user_id");

-- RedefineIndex
DROP INDEX "sqlite_autoindex_countries_5";
CREATE UNIQUE INDEX "countries_phone_code_key" ON "countries"("phone_code");

-- RedefineIndex
DROP INDEX "sqlite_autoindex_countries_4";
CREATE UNIQUE INDEX "countries_num_code_key" ON "countries"("num_code");

-- RedefineIndex
DROP INDEX "sqlite_autoindex_countries_3";
CREATE UNIQUE INDEX "countries_iso3166_3_key" ON "countries"("iso3166_3");

-- RedefineIndex
DROP INDEX "sqlite_autoindex_countries_2";
CREATE UNIQUE INDEX "countries_iso3166_2_key" ON "countries"("iso3166_2");

-- RedefineIndex
DROP INDEX "sqlite_autoindex_countries_1";
CREATE UNIQUE INDEX "countries_name_key" ON "countries"("name");
