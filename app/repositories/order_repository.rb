require 'csv'
require_relative '../models/order'

class OrderRepository
  def initialize(csv_file_path,
                 meal_repository,
                 customer_repository,
                 employee_repository)
    @csv_file_path = csv_file_path
    @meal_repository = meal_repository
    @customer_repository = customer_repository
    @employee_repository = employee_repository

    @orders = []
    @next_id = 1
    load_csv if File.exist?(csv_file_path)
  end

  def all
    @orders
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end

  def create(order)
    order.id = @next_id
    @next_id += 1
    # Add the order to its employee:
    order.employee.add_order(order)
    @orders << order
    save_csv
  end

  def deliver(order)
    order.deliver!
    save_csv
  end

  private

  def load_csv
    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      row[:delivered] = row[:delivered] == 'true'
      row[:customer] = @customer_repository.find(row[:customer_id].to_i)
      row[:employee] = @employee_repository.find(row[:employee_id].to_i)
      row[:meal] = @meal_repository.find(row[:meal_id].to_i)
      order = Order.new(row)
      # Also add the order to its employee
      order.employee.add_order(order)
      @orders << order
    end
    @next_id = @orders.last.id + 1 if @orders.any?
  end

  def save_csv
    CSV.open(@csv_file_path, 'wb') do |csv|
      csv << %w[id delivered customer_id employee_id meal_id]
      @orders.each do |order|
        csv << [order.id, order.delivered?, order.customer.id,
                order.employee.id, order.meal.id]
      end
    end
  end
end
