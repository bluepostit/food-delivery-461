require_relative '../views/sessions_view'

class SessionsController
  def initialize(employee_repository)
    @employee_repo = employee_repository
    @view = SessionsView.new
  end

  def sign_in
    # ask user for username
    username = @view.ask_for('username')
    # ask user for password
    password = @view.ask_for('password')
    # check whether a user with these credentials exists in the db:
    # find an employee with the username
    employee = @employee_repo.find_by_username(username)
    # check if the given password is correct for that user
    if employee && employee.password == password
      @view.welcome_user(employee)
      return employee
    else
      @view.incorrect_credentials
      sign_in
    end
  end
end
