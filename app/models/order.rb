class Order
  attr_reader :meal, :customer, :employee
  attr_accessor :id

  def initialize(attr = {})
    @id = attr[:id]
    @delivered = attr[:delivered] || false
    @meal = attr[:meal]
    @customer = attr[:customer]
    @employee = attr[:employee]
  end

  def delivered?
    @delivered
  end
end
