
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
  first_name: "Rose",
  last_name: "santa"
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
  title: "Fried Rice",
  description: "Wow Delicious homemade fried rice with vegetables.Soo tasty",
  duration: 30,
  description_easy: "Simple fried rice for beginners.",
  duration_easy: 20
)

recipe2 = Recipe.create!(
  title: "Baked Chicken",
  description: "WOW Juicy oven-baked chicken with spices.",
  duration: 45,
  description_easy: " baked chicken with fewer ingredients.",
  duration_easy: 35
)

recipe3 = Recipe.create!(
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
puts "Recipes created: #{Recipe.count}"


puts "Creating ingredients."
ingredient1 = Ingredient.create!(ingredient_name: "Rice", category: "Grains")
ingredient2 = Ingredient.create!(ingredient_name: "Oil", category: "Cooking Essentials")
ingredient3 = Ingredient.create!(ingredient_name: "Ginger", category: "Spices")
ingredient4 = Ingredient.create!(ingredient_name: "Chicken", category: "Meat")
ingredient5 = Ingredient.create!(ingredient_name: "Penne", category: "Grains")
ingredient6 = Ingredient.create!(ingredient_name: "red chillies", category: "Vegetable")
ingredient7 = Ingredient.create!(ingredient_name: "garlic", category: "Spices")
ingredient8 = Ingredient.create!(ingredient_name: "basil leaves", category: "Spices")
ingredient9 = Ingredient.create!(ingredient_name: "tomatoes", category: "Vegetable")
ingredient10 = Ingredient.create!(ingredient_name: "Parmesan", category: "Milk product")
puts "Ingredients created: #{Ingredient.count}"

puts "Creating meal ingredients."
meal_ingredient1 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient1, portion: 100)
meal_ingredient2 = MealIngredient.create!(recipe: recipe1, ingredient: ingredient2, portion: 2)
meal_ingredient3 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient3, portion: 5)
meal_ingredient4 = MealIngredient.create!(recipe: recipe2, ingredient: ingredient4, portion: 500)
meal_ingredient5 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient5, portion: 400)
meal_ingredient6 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient6, portion: 2)
meal_ingredient7 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient7, portion: 2)
meal_ingredient8 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient8, portion: 4)
meal_ingredient9 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient9, portion: 10)
meal_ingredient10 = MealIngredient.create!(recipe: recipe3, ingredient: ingredient10, portion: 20)
puts "Creating groceries."
[meal_ingredient1, meal_ingredient2, meal_ingredient3, meal_ingredient4, meal_ingredient5, meal_ingredient6, meal_ingredient7, meal_ingredient8, meal_ingredient9, meal_ingredient10].each do |meal_ingredient|
  Grocery.create!(meal_ingredient: meal_ingredient)
end
puts "Groceries created: #{Grocery.count}"


puts "Creating menus."
menu1 = Menu.create!(calendar: calendar1, recipe: recipe1, date: Date.today, participants: 4, cook_name: "Rose", menu_style: "Casual")
menu2 = Menu.create!(calendar: calendar2, recipe: recipe2, date: Date.today + 1, participants: 3, cook_name: "Mary", menu_style: "Formal")
puts "Menus created: #{Menu.count}"


puts "Creating comments."
Comment.create!(rating: 5, recipe: recipe1, user: user1)
Comment.create!(rating: 3, recipe: recipe2, user: user2)
puts "Comments created: #{Comment.count}"
