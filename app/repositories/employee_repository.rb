require 'csv'
require_relative '../models/employee'

class EmployeeRepository
  def initialize(csv_file_path)
    @csv_file_path = csv_file_path
    @employees = []
    load_csv if File.exist?(csv_file_path)
  end

  def find_by_username(username)
    @employees.find { |employee| employee.username == username }
  end

  def find(id)
    @employees.find { |employee| employee.id == id }
  end

  def all_delivery_guys
    @employees.select { |employee| employee.delivery_guy? }
  end

  def get_delivery_guy(index)
    all_delivery_guys[index]
  end

  private

  def load_csv
    csv_options = {
      headers: :first_row,
      header_converters: :symbol
    }
    CSV.foreach(@csv_file_path, csv_options) do |row|
      row[:id] = row[:id].to_i
      employee = Employee.new(row)
      @employees << employee
    end
  end
end
