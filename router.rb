# TODO: implement the router of your app.
class Router
  def initialize(meals_controller, customers_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @running = true
  end

  def run
    while @running
      # display menu
      # get user's choice
      # dispatch action - user's choice
      display_menu
      action = user_action
      print `clear`
      dispatch(action)
    end
  end

  private

  def display_menu
    puts '  ~~~ MENU ~~~'
    puts '1. Add a meal'
    puts '2. List all meals'
    puts '3. Add a customer'
    puts '4. List all customers'
    puts '9. Exit'
  end

  def user_action
    puts 'Please enter your choice:'
    print '> '
    gets.chomp.to_i
  end

  def dispatch(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 9 then stop
    else puts "Please try again"
    end
    puts "\n"
  end

  def stop
    @running = false
  end
end
