import { db } from "@/lib/db";

async function main() {
  const user = await db.user.create({
    data: {
      name: "Alice",
      email: "alice@example.com",
      password: "admin",
      role:"ADMIN",
      meals: {
        create: [
          {
            name: "Breakfast",
            mealFoods: {
              create: [
                {
                  amount: 100,
                  food: {
                    create: {
                      name: "Oatmeal",
                      fats: 5,
                      carbohydrates: 27,
                      suger: 0,
                      fiber: 4,
                      foodServingUnits: {
                        create: [
                          {
                            grams: 100,
                            serving_unit: {
                              connectOrCreate: {
                                where: { name: "Gram" },
                                create: { name: "Gram" },
                              },
                            },
                          },
                        ],
                      },
                    },
                  },
                  serving_unit: {
                    connectOrCreate: {
                      where: { name: "Gram" },
                      create: { name: "Gram" },
                    },
                  },
                },
              ],
            },
          },
        ],
      },
    },
  })

  console.log("Seeded user:", user)
}

main()
  .catch((e) => {
    console.error(e)
    process.exit(1)
  })
  .finally(async () => {
    await db.$disconnect()
  });