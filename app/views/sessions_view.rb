class SessionsView
  def ask_for(thing)
    puts "Please enter your #{thing}"
    print '~> '
    gets.chomp
  end

  def welcome_user(employee)
    puts "Welcome, #{employee.username.capitalize}!"
  end

  def incorrect_credentials
    puts 'Please try again.'
  end
end
