
'use server'
import { db } from "@/lib/db";

export default async function Home() {
  async function getUser(userId: number) {
    const user = await db.user.findUnique({
      where: { id: userId },
      include: {
        meals: {
          include: {
            mealFoods: {
              include: {
                food: {
                  include: {
                    foodServingUnits: {
                      include: { serving_unit: true },
                    },
                  },
                },
                serving_unit: true,
              },
            },
          },
        },
      },
    });

    return user;
  }

  const user = await getUser(1)
  console.log("🚀 ~ Home ~ user:", user)
  return (
    <div>
      {JSON.stringify(user)}
    </div>
    
  );
}
