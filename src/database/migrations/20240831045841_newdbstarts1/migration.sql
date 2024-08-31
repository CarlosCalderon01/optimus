/*
  Warnings:

  - You are about to drop the `Country` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Country";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "accounts" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "email" TEXT NOT NULL,
    "password_hash" TEXT NOT NULL,
    "verified_account" BOOLEAN,
    "verified_user" BOOLEAN,
    "updated_at" DATETIME,
    "created_at" DATETIME
);

-- CreateIndex
Pragma writable_schema=1;
CREATE UNIQUE INDEX "sqlite_autoindex_accounts_1" ON "accounts"("email");
Pragma writable_schema=0;
