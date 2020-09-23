require_relative '../views/orders_view'
require_relative '../views/meals_view'
require_relative '../views/customers_view'

class OrdersController
  def initialize(meal_repository,
                 customer_repository,
                 employee_repository,
                 order_repository)
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository
    @order_repository = order_repository
    @view = OrdersView.new
    @meals_view = MealsView.new
    @customers_view = CustomersView.new
  end

  def list_undelivered
    # get the orders from order repo
    # list them using a view
    orders = @order_repository.all_undelivered
    @view.display(orders)
  end

  def create
    # list all meals
    @meals_view.display(@meal_repository.all)
    # ask user for the meal INDEX
    meal_index = @view.ask_for_index('meal')
    # get Meal object corresponding to the index
    meal = @meal_repository.get(meal_index)

    # list all customers
    @customers_view.display(@customer_repository.all)
    # ask user for customer INDEX
    customer_index = @view.ask_for_index('customer')
    # get Customer object corr. to the index
    customer = @customer_repository.get(customer_index)

    # list all delivery guys
    @view.display_employees(@employee_repository.all_delivery_guys)
    # ask user for INDEX of the DELIVERY GUYS (not all employees!)
    delivery_guy_index = @view.ask_for_index('employee')
    # get Employee object corr. to the index
    delivery_guy = @employee_repository.get_delivery_guy(delivery_guy_index)

    order = Order.new(meal: meal, customer: customer, employee: delivery_guy)
    @order_repository.create(order)
  end
end
