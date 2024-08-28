/*
  Warnings:

  - You are about to drop the `TestUser` table. If the table is not empty, all the data it contains will be lost.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "TestUser";
PRAGMA foreign_keys=on;

-- CreateTable
CREATE TABLE "Country" (
    "id" INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
    "name" TEXT NOT NULL,
    "iso3166_2" TEXT NOT NULL,
    "iso3166_3" TEXT NOT NULL,
    "num_code" INTEGER NOT NULL,
    "phone_code" TEXT NOT NULL
);

-- CreateIndex
CREATE UNIQUE INDEX "Country_name_key" ON "Country"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Country_iso3166_2_key" ON "Country"("iso3166_2");

-- CreateIndex
CREATE UNIQUE INDEX "Country_iso3166_3_key" ON "Country"("iso3166_3");

-- CreateIndex
CREATE UNIQUE INDEX "Country_num_code_key" ON "Country"("num_code");
