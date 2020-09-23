require_relative 'app/repositories/meal_repository'
require_relative 'app/repositories/customer_repository'
require_relative 'app/repositories/employee_repository'
require_relative 'app/repositories/order_repository'
require_relative 'router'

meal_csv_path = 'data/meals.csv'
meal_repo = MealRepository.new(meal_csv_path)

customer_csv_path = 'data/customers.csv'
customer_repo = CustomerRepository.new(customer_csv_path)


employee_csv_path = 'data/employees.csv'
employee_repo = EmployeeRepository.new(employee_csv_path)


csv_file_path = 'data/orders.csv'
repo = OrderRepository.new(csv_file_path, meal_repo, customer_repo, employee_repo)
p repo.all
