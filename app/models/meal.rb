class Meal
  attr_reader :name, :price
  attr_accessor :id

  def initialize(attr = {})
    @name = attr[:name]
    @price = attr[:price] || 0
    @id = attr[:id]
  end
end
