-- CreateSchema
CREATE SCHEMA IF NOT EXISTS "meal_planner";

-- CreateTable
CREATE TABLE "meal_planner"."User" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meal_planner"."Meal" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "user_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Meal_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meal_planner"."MealFood" (
    "id" SERIAL NOT NULL,
    "amount" DOUBLE PRECISION NOT NULL,
    "meal_id" INTEGER NOT NULL,
    "food_id" INTEGER NOT NULL,
    "serving_unit_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MealFood_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meal_planner"."Food" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "fats" DOUBLE PRECISION NOT NULL,
    "carbohydrates" DOUBLE PRECISION NOT NULL,
    "suger" DOUBLE PRECISION NOT NULL,
    "fiber" DOUBLE PRECISION NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Food_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meal_planner"."ServingUnit" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "ServingUnit_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "meal_planner"."FoodServingUnit" (
    "id" SERIAL NOT NULL,
    "grams" DOUBLE PRECISION NOT NULL,
    "food_id" INTEGER NOT NULL,
    "serving_unit_id" INTEGER NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "FoodServingUnit_pkey" PRIMARY KEY ("id")
);

-- CreateIndex
CREATE UNIQUE INDEX "User_name_key" ON "meal_planner"."User"("name");

-- CreateIndex
CREATE UNIQUE INDEX "User_email_key" ON "meal_planner"."User"("email");

-- CreateIndex
CREATE UNIQUE INDEX "Meal_name_key" ON "meal_planner"."Meal"("name");

-- CreateIndex
CREATE UNIQUE INDEX "Food_name_key" ON "meal_planner"."Food"("name");

-- CreateIndex
CREATE UNIQUE INDEX "ServingUnit_name_key" ON "meal_planner"."ServingUnit"("name");

-- AddForeignKey
ALTER TABLE "meal_planner"."Meal" ADD CONSTRAINT "Meal_user_id_fkey" FOREIGN KEY ("user_id") REFERENCES "meal_planner"."User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meal_planner"."MealFood" ADD CONSTRAINT "MealFood_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "meal_planner"."Food"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meal_planner"."MealFood" ADD CONSTRAINT "MealFood_meal_id_fkey" FOREIGN KEY ("meal_id") REFERENCES "meal_planner"."Meal"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meal_planner"."MealFood" ADD CONSTRAINT "MealFood_serving_unit_id_fkey" FOREIGN KEY ("serving_unit_id") REFERENCES "meal_planner"."ServingUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meal_planner"."FoodServingUnit" ADD CONSTRAINT "FoodServingUnit_food_id_fkey" FOREIGN KEY ("food_id") REFERENCES "meal_planner"."Food"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "meal_planner"."FoodServingUnit" ADD CONSTRAINT "FoodServingUnit_serving_unit_id_fkey" FOREIGN KEY ("serving_unit_id") REFERENCES "meal_planner"."ServingUnit"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
