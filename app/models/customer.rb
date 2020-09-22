class Customer
  attr_reader :name, :address
  attr_accessor :id

  def initialize(attr = {})
    @name = attr[:name]
    @address = attr[:address]
    @id = attr[:id]
  end
end
