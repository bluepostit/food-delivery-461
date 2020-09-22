require_relative '../views/meals_view'

class MealsController
  def initialize(meal_repository)
    @meal_repo = meal_repository
    @view = MealsView.new
  end

  def list
    # Get all meals from the repository
    # Display them using the view
    meals = @meal_repo.all
    @view.display(meals)
  end

  def add
    # get the name from the user
    # get the price from the user
    # create a new Meal object
    # add it to the repository
    name = @view.ask_for('name')
    price = @view.ask_for_price
    meal = Meal.new(name: name, price: price)
    @meal_repo.create(meal)
  end
end
