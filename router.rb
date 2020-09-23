# TODO: implement the router of your app.
class Router
  def initialize(meals_controller,
                 customers_controller,
                 sessions_controller)
    @meals_controller = meals_controller
    @customers_controller = customers_controller
    @sessions_controller = sessions_controller
    @running = true
  end

  def run
    # Login...
    while @running
      @employee = @sessions_controller.sign_in
      while @employee
        # display menu
        # get user's choice
        # dispatch action - user's choice
        if @employee.manager?
          display_manager_menu
          action = user_action
          print `clear`
          dispatch_manager_action(action)
        else
          display_delivery_menu
          action = user_action
          print `clear`
          dispatch_delivery_action(action)
        end
      end
    end
  end

  private

  def display_manager_menu
    puts '  ~~~ MENU ~~~'
    puts '1. Add a meal'
    puts '2. List all meals'
    puts '3. Add a customer'
    puts '4. List all customers'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def display_delivery_menu
    puts '  ~~~ MENU ~~~'
    puts '1. Deliver an order'
    puts '2. List undelivered orders'
    puts '8. Sign out'
    puts '9. Exit'
  end

  def user_action
    puts 'Please enter your choice:'
    print '> '
    gets.chomp.to_i
  end

  def dispatch_manager_action(action)
    case action
    when 1 then @meals_controller.add
    when 2 then @meals_controller.list
    when 3 then @customers_controller.add
    when 4 then @customers_controller.list
    when 8 then sign_out
    when 9 then stop
    else puts "Please try again"
    end
    puts "\n"
  end

  def dispatch_delivery_action(action)
    case action
    when 1 then puts 'not implemented yet'
    when 2 then puts 'not implemented yet'
    when 8 then sign_out
    when 9 then stop
    else puts "Please try again"
    end
    puts "\n"
  end

  def stop
    sign_out
    @running = false
  end

  def sign_out
    @employee = nil
  end
end
