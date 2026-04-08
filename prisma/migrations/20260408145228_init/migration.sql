/*
  Warnings:

  - Added the required column `role` to the `User` table without a default value. This is not possible if the table is not empty.

*/
-- CreateEnum
CREATE TYPE "meal_planner"."Role" AS ENUM ('ADMIN', 'USER');

-- AlterTable
ALTER TABLE "meal_planner"."User" ADD COLUMN     "role" "meal_planner"."Role" NOT NULL;
