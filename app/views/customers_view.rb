class CustomersView
  def display(customers)
    customers.each_with_index do |customer, index|
      puts "#{index + 1}. #{customer.name}"
    end
  end

  def ask_for(thing)
    puts "Please enter the #{thing}:"
    print '> '
    gets.chomp
  end
end
