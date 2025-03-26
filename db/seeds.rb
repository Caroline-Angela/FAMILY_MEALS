
require "open-uri"

UserCalendar.destroy_all
Comment.destroy_all
Grocery.destroy_all
MealIngredient.destroy_all
Ingredient.destroy_all
Menu.destroy_all
Recipe.destroy_all
Calendar.destroy_all
User.destroy_all
puts "DB content deleted."


puts "Creating users."
user1 = User.create!(
  email: "aaa@gmail.com",
  password: "12345678",
  password_confirmation: "12345678",
  first_name: "Brad",
  last_name: "Bocuse"
)

user2 = User.create!(
  email: "bbb@gmail.com",
  password: "123456789",
  password_confirmation: "123456789",
  first_name: "Mary",
  last_name: "Silva"
)
puts "Users created: #{User.count}"

puts "Creating new calendars."
calendar1 = Calendar.create!
calendar2 = Calendar.create!
puts "Calendars created: #{Calendar.count}"


UserCalendar.create!(user: user1, calendar: calendar1)
UserCalendar.create!(user: user2, calendar: calendar2)
puts "UserCalendars assigned!"

puts "Creating recipes."

recipe1 = Recipe.create!(
  title: "Grilled Sardines",
  description: "
  Prepare the Sardines:

  Rinse the sardines and pat them dry. If you prefer, you can remove the scales, but it's not necessary.
  Marinate (Optional):

  In a bowl, mix olive oil, lemon juice, minced garlic, salt, and pepper. You can also add fresh herbs like parsley or oregano, or a pinch of paprika for extra flavor.
  Place the sardines in the marinade and let them sit for about 10-15 minutes.
  Preheat the Grill:

  Heat your grill or grill pan to medium-high heat. Make sure it's clean and lightly oiled to prevent the fish from sticking.
  Grill the Sardines:

  Place the sardines on the grill. Cook for about 3-5 minutes on each side, or until the skin is crispy and slightly charred, and the fish is cooked through.
  Serve:

  Transfer the grilled sardines to a serving platter. Drizzle with a bit more olive oil and lemon juice. Sprinkle with additional herbs or paprika if desired.
  Serve immediately with lemon wedges, crusty bread, and a side salad.
  Enjoy your delicious Grilled Sardines!",
  duration: 25,
  description_easy: "Sardines with a delicious grilled touch.",
  duration_easy: 2
)

file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.6SkJBdtLkXmghaxNvzRO0gHaFj&pid=Api").open
recipe1.photo.attach(io: file, filename: "grilled_sardines", content_type: "image/jpg")
recipe1.save
puts "Is an image attached to #{recipe1.title} ? #{recipe1.photo.attached?}"

recipe2 = Recipe.create!(
  title: "Smoked Salmon",
  description: "
  Prepare the Salmon:

  Rinse the salmon fillets and pat them dry with paper towels.
  Remove any pin bones if necessary.
  Brine the Salmon:

  In a bowl, mix together equal parts of salt and brown sugar. Add black pepper and any optional seasonings like dill, garlic powder, or lemon zest.
  Rub the mixture evenly over the salmon fillets, ensuring they are well coated.
  Cure the Salmon:

  Place the salmon fillets on a wire rack over a baking sheet. Let them cure in the refrigerator for at least 2 hours, or up to overnight. This helps to draw out moisture and infuse the flavors.
  Form the Pellicle:

  After curing, rinse the salmon fillets under cold water to remove the excess brine. Pat them dry again.
  Place the fillets back on the wire rack and let them air-dry in the refrigerator for another 1-2 hours. This step forms a pellicle, a thin layer that helps the smoke adhere to the fish.
  Preheat the Smoker:

  Preheat your smoker to 225°F (107°C). Add your chosen wood chips for smoking.
  Smoke the Salmon:

  Place the salmon fillets skin-side down on the smoker rack.
  Smoke the salmon for about 2-3 hours, or until it reaches an internal temperature of 140°F (60°C). The exact time will depend on the thickness of the fillets.
  Rest and Serve:

  Remove the salmon from the smoker and let it rest for a few minutes.
  Serve the smoked salmon with lemon wedges, fresh dill, and your favorite sides.
  Enjoy your delicious Smoked Salmon! ",
  duration: 45,
  description_easy: " Smoking salmon is the perfect treat.",
  duration_easy: 35
)

file = URI.parse("https://tse1.explicit.bing.net/th?id=OIP.8jigYVeB_5jd0pF4QpY8QwHaE7&pid=Api").open
recipe2.photo.attach(io: file, filename: "smoked_salmon", content_type: "image/jpg")
recipe2.save
puts "Is an image attached to #{recipe2.title} ? #{recipe2.photo.attached?}"

recipe3 = Recipe.create!(
  title: "Baked Chicken",
  description: "Preheat the Oven:

  Preheat your oven to 425°F (220°C).
  Prepare the Chicken:

  Pat the chicken breasts dry with paper towels. This helps to achieve a better sear and crispier skin if you're using skin-on chicken.
  Season the Chicken:

  In a small bowl, mix together salt, black pepper, garlic powder, and paprika (if using). You can also add other seasonings like dried herbs or lemon zest for extra flavor.
  Lightly coat the chicken breasts with olive oil, ensuring they are evenly covered.
  Rub the seasoning mixture onto both sides of the chicken breasts, making sure they are well coated.
  Bake the Chicken:

  Place the chicken breasts on a baking sheet lined with parchment paper or foil.
  Bake for about 18-20 minutes, or until the internal temperature reaches 165°F (74°C). Use a meat thermometer to check the temperature in the thickest part of the breast.
  Rest the Chicken:

  Remove the chicken from the oven and let it rest for 5-10 minutes. This allows the juices to redistribute throughout the meat, ensuring a juicier and more flavorful result.
  Serve:

  Slice the chicken breasts and serve with your favorite sides. Enjoy your perfectly baked chicken!
  This recipe is versatile and can be customized with your preferred seasonings. It's great for meal prep and pairs well with various side dishes. ",
  duration: 45,
  description_easy: " Delicious baked chicken.",
  duration_easy: 35
)

file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.4HQGMbX4FKbcpBv3_bwzTQHaGS&pid=Api").open
recipe3.photo.attach(io: file, filename: "baked_chicken", content_type: "image/jpg")
recipe3.save
puts "Is an image attached to #{recipe3.title} ? #{recipe3.photo.attached?}"

recipe4 = Recipe.create!(
  title: "Fried Rice",
  description: "Prepare the Ingredients:

  Ensure your rice is cooled and preferably a day old for the best texture.
  Chop the onion, garlic, and green onions. Dice any vegetables you are using.
  Scramble the Eggs:

  Heat 1 tablespoon of oil in a large skillet or wok over medium-high heat.
  Pour in the beaten eggs and scramble until fully cooked. Remove the eggs from the skillet and set aside.
  Sauté the Vegetables:

  In the same skillet, add another tablespoon of oil.
  Add the chopped onion and garlic, and sauté until fragrant, about 1-2 minutes.
  Add the mixed vegetables and cook until they are tender, about 3-4 minutes.
  Add the Rice:

  Increase the heat to high and add the remaining oil.
  Add the cooked rice to the skillet, breaking up any lumps. Stir-fry the rice with the vegetables for about 3-4 minutes, until the rice is heated through and slightly crispy.
  Season the Fried Rice:

  Pour the soy sauce and sesame oil over the rice mixture. Stir well to combine.
  Add the scrambled eggs back into the skillet and mix everything together.
  Season with salt and pepper to taste.
  Finish and Serve:

  Stir in the chopped green onions.
  If using any cooked protein, add it to the skillet and mix well.
  Serve the fried rice hot, garnished with additional green onions if desired.
  Enjoy your delicious Fried Rice! This recipe is highly customizable, so feel free to add your favorite vegetables or proteins. ",
    duration: 30,
    description_easy: "Simple fried rice for beginners.",
    duration_easy: 20
)

file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.6TbOEpe5a_9zXWsDIUP2SAHaHa&pid=Api").open
recipe4.photo.attach(io: file, filename: "fried_rice", content_type: "image/jpg")
recipe4.save
puts "Is an image attached to #{recipe4.title} ? #{recipe4.photo.attached?}"

recipe5 = Recipe.create!(
  title: "Penne Arrabbiata",
  description: "Heat the olive oil in a frying pan. Add the chilli and garlic to the pan. After about a minute, add the basil leaves and gently wilt them in the flavoured oil.

  Remove the garlic, basil and chilli from the pan and set aside. Add the chopped tomatoes to the frying pan.

  Put the garlic, basil and chilli back in the pan with the tomatoes. Simmer for at least 10 minutes, until the sauce has thickened a little. Add salt to taste.

  Meanwhile, cook the pasta according to the packet instructions in large saucepan of boiling, salted water until al dente.

  Drain the pasta and the tomato sauce to it. Serve with shavings of parmesan.",
  duration: 30,
  description_easy: " Penne with spicy tomato sauce.",
  duration_easy: 20
)
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.kiUUT_xU8E6BG6eQ5QFr7QHaJQ&pid=Api").open
recipe5.photo.attach(io: file, filename: "penne_arrabiata", content_type: "image/jpg")
recipe5.save
puts "Is an image attached to #{recipe5.title} ? #{recipe5.photo.attached?}"

# Recipe 6: Spaghetti Carbonara
recipe6 = Recipe.create!(
  title: "Spaghetti Carbonara",
  description: "Spaghetti carbonara combines crispy pancetta, parmesan cheese, and a creamy sauce made from simple ingredients you likely have on hand. The sauce is so rich and creamy and this pasta has lots of flavor. Carbonara is made with pancetta or bacon—and you likely have the rest of the ingredients on hand. This recipe is quick enough to make for a weeknight meal.",
  duration: 30,
  description_easy: "Creamy, But No Cream",
  duration_easy: 20
)
file = URI.parse("https://tse2.mm.bing.net/th?id=OIP.QV9ghFBPFkK3-SuYzhNDDwHaHW&pid=Api").open
recipe6.photo.attach(io: file, filename: "spaghetti_carbonara", content_type: "image/jpg")
recipe6.save
puts "Is an image attached to #{recipe6.title} ? #{recipe6.photo.attached?}"

# Recipe 7: Classic Margherita Pizza
recipe7 = Recipe.create!(
  title: "Classic Margherita Pizza",
  description: "A classic Italian pizza with a thin crust, topped with fresh mozzarella, ripe tomatoes, basil leaves, salt, and a drizzle of olive oil. Simple, delicious, and perfect for any occasion.",
  duration: 45,
  description_easy: "Easy homemade pizza with fresh ingredients.",
  duration_easy: 30
)
file = URI.parse("https://tse1.mm.bing.net/th?id=OIP.Ft6idmnInXMCfVWYb4Ym5gHaLH&pid=Api").open
recipe7.photo.attach(io: file, filename: "margherita_pizza", content_type: "image/jpg")
recipe7.save
puts "Is an image attached to #{recipe7.title} ? #{recipe7.photo.attached?}"

# Recipe 8: Chicken Caesar Salad
recipe8 = Recipe.create!(
  title: "Chicken Caesar Salad",
  description: "A refreshing salad featuring romaine lettuce, croutons, Parmesan cheese, and Caesar dressing, topped with grilled chicken breast. Perfect for a light lunch or dinner.",
  duration: 25,
  description_easy: "Quick and easy Caesar salad with grilled chicken.",
  duration_easy: 15
)
file = URI.parse("https://tse4.mm.bing.net/th?id=OIP.C2vSONUOesXv2-mqKwyNmwHaHa&pid=Api").open
recipe8.photo.attach(io: file, filename: "chicken_caesar_salad", content_type: "image/jpg")
recipe8.save
puts "Is an image attached to #{recipe8.title} ? #{recipe8.photo.attached?}"

puts "Recipes created: #{Recipe.count}"

puts "Creating ingredients."

# Grilled Sardines
ingredient1 = Ingredient.create!(ingredient_name: "Sardines", category: "Fish")
ingredient2 = Ingredient.create!(ingredient_name: "Olive Oil", category: "Oil")
ingredient3 = Ingredient.create!(ingredient_name: "Lemon", category: "Fruit")
ingredient4 = Ingredient.create!(ingredient_name: "Garlic", category: "Vegetable")
ingredient5 = Ingredient.create!(ingredient_name: "Salt", category: "Seasoning")
ingredient6 = Ingredient.create!(ingredient_name: "Pepper", category: "Seasoning")
ingredient7 = Ingredient.create!(ingredient_name: "Fresh Herbs (e.g., Parsley, Oregano)", category: "Herb")
ingredient8 = Ingredient.create!(ingredient_name: "Paprika", category: "Seasoning")

# Smoked Salmon
ingredient9 = Ingredient.create!(ingredient_name: "Salmon Fillets", category: "Fish")
ingredient10 = Ingredient.create!(ingredient_name: "Brown Sugar", category: "Sweetener")
ingredient11 = Ingredient.create!(ingredient_name: "Black Pepper", category: "Seasoning")
ingredient12 = Ingredient.create!(ingredient_name: "Optional Seasonings (e.g., Dill, Garlic Powder, Lemon Zest)", category: "Seasoning")
ingredient13 = Ingredient.create!(ingredient_name: "Wood Chips for Smoking (e.g., Alder, Cherry, Apple)", category: "Smoking")

# Baked Chicken
ingredient14 = Ingredient.create!(ingredient_name: "Boneless, Skinless Chicken Breasts", category: "Meat")
ingredient15 = Ingredient.create!(ingredient_name: "Garlic Powder", category: "Seasoning")
ingredient16 = Ingredient.create!(ingredient_name: "Other Seasonings of Your Choice (e.g., Dried Herbs, Lemon Zest)", category: "Seasoning")

# Fried Rice
ingredient17 = Ingredient.create!(ingredient_name: "Cooked and Cooled Rice", category: "Grain")
ingredient18 = Ingredient.create!(ingredient_name: "Vegetable Oil or Butter", category: "Oil")
ingredient19 = Ingredient.create!(ingredient_name: "Eggs", category: "Dairy")
ingredient20 = Ingredient.create!(ingredient_name: "Onion", category: "Vegetable")
ingredient21 = Ingredient.create!(ingredient_name: "Mixed Vegetables (e.g., Peas, Carrots, Bell Peppers)", category: "Vegetable")
ingredient22 = Ingredient.create!(ingredient_name: "Soy Sauce", category: "Sauce")
ingredient23 = Ingredient.create!(ingredient_name: "Sesame Oil", category: "Oil")
ingredient24 = Ingredient.create!(ingredient_name: "Green Onions", category: "Vegetable")
ingredient25 = Ingredient.create!(ingredient_name: "Optional: Cooked Protein (e.g., Chicken, Shrimp, Tofu)", category: "Meat")

# Penne Arrabbiata
ingredient26 = Ingredient.create!(ingredient_name: "Penne", category: "Grains")
ingredient27 = Ingredient.create!(ingredient_name: "Red Chillies", category: "Vegetable")
ingredient28 = Ingredient.create!(ingredient_name: "Basil Leaves", category: "Herb")
ingredient29 = Ingredient.create!(ingredient_name: "Tomatoes", category: "Vegetable")
ingredient30 = Ingredient.create!(ingredient_name: "Parmesan", category: "Milk product")

# Ingredients for Spaghetti Carbonara
ingredient41 = Ingredient.create!(ingredient_name: "Pancetta", category: "Meat")
ingredient42 = Ingredient.create!(ingredient_name: "Parmesan Cheese", category: "Dairy")
ingredient43 = Ingredient.create!(ingredient_name: "Eggs", category: "Dairy")
ingredient44 = Ingredient.create!(ingredient_name: "Spaghetti", category: "Pasta")
ingredient45 = Ingredient.create!(ingredient_name: "Garlic", category: "Vegetable")
ingredient46 = Ingredient.create!(ingredient_name: "Black Pepper", category: "Spice")

# Ingredients for Classic Margherita Pizza
ingredient47 = Ingredient.create!(ingredient_name: "Pizza Dough", category: "Bakery")
ingredient48 = Ingredient.create!(ingredient_name: "Mozzarella", category: "Dairy")
ingredient49 = Ingredient.create!(ingredient_name: "Tomatoes", category: "Vegetable")
ingredient50 = Ingredient.create!(ingredient_name: "Basil", category: "Herb")
ingredient51 = Ingredient.create!(ingredient_name: "Olive Oil", category: "Oil")


# Ingredients for Chicken Caesar Salad
ingredient52 = Ingredient.create!(ingredient_name: "Chicken Breast", category: "Meat")
ingredient53 = Ingredient.create!(ingredient_name: "Romaine Lettuce", category: "Vegetable")
ingredient54 = Ingredient.create!(ingredient_name: "Croutons", category: "Bakery")
ingredient55 = Ingredient.create!(ingredient_name: "Caesar Dressing", category: "Sauce")

puts "Ingredients created: #{Ingredient.count}"

# Grilled Sardines Meal Ingredients
meal_ingredient1 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient1, portion: 500) # 500g of sardines
meal_ingredient2 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient2, portion: 30) # 30ml of olive oil
meal_ingredient3 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient3, portion: 1) # 1 lemon
meal_ingredient4 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient4, portion: 2) # 2 cloves of garlic
meal_ingredient5 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient5, portion: 5) # 5g of salt
meal_ingredient6 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient6, portion: 2) # 2g of pepper
meal_ingredient7 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient7, portion: 10) # 10g of fresh herbs
meal_ingredient8 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient8, portion: 5) # 5g of paprika

# Smoked Salmon Meal Ingredients
meal_ingredient9 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient9, portion: 1000) # 1kg of salmon fillets
meal_ingredient10 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient5, portion: 20) # 20g of salt
meal_ingredient11 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient10, portion: 50) # 50g of brown sugar
meal_ingredient12 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient11, portion: 5) # 5g of black pepper
meal_ingredient13 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient12, portion: 10) # 10g of optional seasonings
meal_ingredient14 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient13, portion: 100) # 100g of wood chips

# Baked Chicken Meal Ingredients
meal_ingredient15 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient14, portion: 800) # 800g of chicken breasts
meal_ingredient16 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient2, portion: 20) # 20ml of olive oil
meal_ingredient17 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient5, portion: 5) # 5g of salt
meal_ingredient18 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient11, portion: 3) # 3g of black pepper
meal_ingredient19 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient15, portion: 5) # 5g of garlic powder
meal_ingredient20 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient8, portion: 5) # 5g of paprika
meal_ingredient21 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient16, portion: 10) # 10g of other seasonings

# Fried Rice Meal Ingredients
meal_ingredient22 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient17, portion: 750) # 750g of cooked rice
meal_ingredient23 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient18, portion: 60) # 60ml of vegetable oil
meal_ingredient24 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient19, portion: 2) # 2 eggs
meal_ingredient25 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient20, portion: 100) # 100g of onion
meal_ingredient26 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient4, portion: 2) # 2 cloves of garlic
meal_ingredient27 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient21, portion: 200) # 200g of mixed vegetables
meal_ingredient28 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient22, portion: 45) # 45ml of soy sauce
meal_ingredient29 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient23, portion: 15) # 15ml of sesame oil
meal_ingredient30 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient24, portion: 20) # 20g of green onions
meal_ingredient31 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient5, portion: 5) # 5g of salt
meal_ingredient32 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient6, portion: 2) # 2g of pepper
meal_ingredient33 = MealIngredient.create!(recipe: recipe4, ingredient: ingredient25, portion: 200) # 200g of optional protein

# Penne Arrabbiata Meal Ingredients
meal_ingredient34 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient26, portion: 400) # 400g of penne
meal_ingredient35 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient2, portion: 20) # 20ml of olive oil
meal_ingredient36 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient27, portion: 2) # 2 red chillies
meal_ingredient37 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient4, portion: 2) # 2 cloves of garlic
meal_ingredient38 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient28, portion: 4) # 4 basil leaves
meal_ingredient39 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient29, portion: 10) # 10 tomatoes
meal_ingredient40 = MealIngredient.create!(recipe: recipe5, ingredient: ingredient30, portion: 20) # 20g of parmesan

# Meal Ingredients for Spaghetti Carbonara
meal_ingredient41 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient41, portion: 100) # 100g of pancetta
meal_ingredient42 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient42, portion: 50) # 50g of parmesan cheese
meal_ingredient43 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient43, portion: 2) # 2 eggs
meal_ingredient44 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient44, portion: 300) # 300g of spaghetti
meal_ingredient45 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient45, portion: 2) # 2 cloves of garlic
meal_ingredient46 = MealIngredient.create!(recipe: recipe6, ingredient: ingredient46, portion: 5) # 5g of black pepper

# Meal Ingredients for Classic Margherita Pizza
meal_ingredient47 = MealIngredient.create!(recipe: recipe7, ingredient: ingredient47, portion: 250) # 250g of pizza dough
meal_ingredient48 = MealIngredient.create!(recipe: recipe7, ingredient: ingredient48, portion: 150) # 150g of mozzarella
meal_ingredient49 = MealIngredient.create!(recipe: recipe7, ingredient: ingredient49, portion: 2) # 2 tomatoes
meal_ingredient50 = MealIngredient.create!(recipe: recipe7, ingredient: ingredient50, portion: 10) # 10g of basil
meal_ingredient51 = MealIngredient.create!(recipe: recipe7, ingredient: ingredient51, portion: 20) # 20ml of olive oil

# Meal Ingredients for Chicken Caesar Salad
meal_ingredient52 = MealIngredient.create!(recipe: recipe8, ingredient: ingredient52, portion: 200) # 200g of chicken breast
meal_ingredient53 = MealIngredient.create!(recipe: recipe8, ingredient: ingredient53, portion: 150) # 150g of romaine lettuce
meal_ingredient54 = MealIngredient.create!(recipe: recipe8, ingredient: ingredient54, portion: 50) # 50g of croutons
meal_ingredient55 = MealIngredient.create!(recipe: recipe8, ingredient: ingredient42, portion: 30) # 30g of parmesan cheese
meal_ingredient56 = MealIngredient.create!(recipe: recipe8, ingredient: ingredient55, portion: 50) # 50ml of Caesar dressing

puts "Meal Ingredients created: #{MealIngredient.count}"

puts "Creating groceries."

puts "Creating groceries."
[meal_ingredient1, meal_ingredient2, meal_ingredient3, meal_ingredient4, meal_ingredient5,
  meal_ingredient6, meal_ingredient7, meal_ingredient8, meal_ingredient9, meal_ingredient10,
  meal_ingredient11, meal_ingredient12, meal_ingredient13, meal_ingredient14, meal_ingredient15,
  meal_ingredient16, meal_ingredient17, meal_ingredient18, meal_ingredient19, meal_ingredient20,
  meal_ingredient21, meal_ingredient22, meal_ingredient23, meal_ingredient24, meal_ingredient25,
  meal_ingredient26, meal_ingredient27, meal_ingredient28, meal_ingredient29, meal_ingredient30,
  meal_ingredient31, meal_ingredient32, meal_ingredient33, meal_ingredient34, meal_ingredient35,
  meal_ingredient36, meal_ingredient37, meal_ingredient38, meal_ingredient39, meal_ingredient40,
  meal_ingredient41, meal_ingredient42, meal_ingredient43, meal_ingredient44, meal_ingredient45,
  meal_ingredient46, meal_ingredient47, meal_ingredient48, meal_ingredient49, meal_ingredient50,
  meal_ingredient51, meal_ingredient52, meal_ingredient53, meal_ingredient54, meal_ingredient55,
  meal_ingredient56].each do |meal_ingredient|
  Grocery.create!(meal_ingredient: meal_ingredient, completed: false)
end
puts "Groceries created: #{Grocery.count}"

puts "Creating menus."
# Note : Menu Style 1 = normal. Menu Style 2 = easy
Menu.create!(calendar: calendar1, recipe: recipe1, date: Date.today, participants: 4, cook_name: "Paul", menu_style: 1)
Menu.create!(calendar: calendar1, recipe: recipe2, date: Date.today + 1, participants: 4, cook_name: "Peter", menu_style: 1)
Menu.create!(calendar: calendar1, recipe: recipe3, date: Date.today + 3, participants: 4, cook_name: "Lucas", menu_style: 1)
Menu.create!(calendar: calendar1, recipe: recipe4, date: Date.today + 5, participants: 4, cook_name: "Paul", menu_style: 1)
puts "Menus created: #{Menu.count}"

puts "Creating comments."
Comment.create!(rating: 5, recipe: recipe1, user: user1, favorite: false)
Comment.create!(rating: 3, recipe: recipe2, user: user2, favorite: true)
Comment.create!(rating: 4, recipe: recipe3, user: user1, favorite: true)
Comment.create!(rating: 4, recipe: recipe2, user: user1, favorite: true)
Comment.create!(rating: 4, recipe: recipe4, user: user1, favorite: false)
Comment.create!(rating: 4, recipe: recipe5, user: user1, favorite: true)
puts "Comments created: #{Comment.count}"

puts "DB successfully seeded !"
