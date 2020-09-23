class Employee
  attr_accessor :id
  attr_reader :username, :password, :role

  def initialize(attr = {})
    @id = attr[:id]
    @username = attr[:username]
    @password = attr[:password]
    @role = attr[:role]
    # Also keep track of this employee's orders!
    @orders = []
  end

  def manager?
    @role == 'manager'
  end

  def delivery_guy?
    @role == 'delivery_guy'
  end

  def add_order(order)
    @orders << order
  end

  def undelivered_orders
    @orders.reject { |order| order.delivered? }
  end
end
