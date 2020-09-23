# TODO: require relevant files to bootstrap the app.
# Then you can test your program with:
#   ruby app.rb
require_relative 'app/repositories/meal_repository'
require_relative 'app/controllers/meals_controller'
require_relative 'app/repositories/customer_repository'
require_relative 'app/controllers/customers_controller'
require_relative 'app/repositories/employee_repository'
require_relative 'app/controllers/sessions_controller'
require_relative 'app/repositories/order_repository'
require_relative 'app/controllers/orders_controller'
require_relative 'router'

meal_csv_path = 'data/meals.csv'
meal_repo = MealRepository.new(meal_csv_path)
meals_controller = MealsController.new(meal_repo)

customer_csv_path = 'data/customers.csv'
customer_repo = CustomerRepository.new(customer_csv_path)
customers_controller = CustomersController.new(customer_repo)

employee_csv_path = 'data/employees.csv'
employee_repo = EmployeeRepository.new(employee_csv_path)
sessions_controller = SessionsController.new(employee_repo)

order_csv_path = 'data/orders.csv'
order_repo = OrderRepository.new(order_csv_path, meal_repo, customer_repo, employee_repo)
orders_controller = OrdersController.new(meal_repo, customer_repo, employee_repo, order_repo)

router = Router.new(meals_controller,
                    customers_controller,
                    sessions_controller,
                    orders_controller)
router.run
