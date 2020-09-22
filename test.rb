require_relative 'app/repositories/meal_repository'
require_relative 'app/models/meal'

csv_path = 'data/meals.csv'
repo = MealRepository.new(csv_path)
p repo
p repo.all.count

meal = Meal.new(name: 'Waldorf Salad', price: 25)
repo.create(meal)
