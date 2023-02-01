module EmployeesHelper
  def validate_employee_searched
    if employee_any?(params[:employee]).empty? # if does not exist any employee with the param name, then this block will be executed.
      redirect_to home_path, error: "No employees found"
      return
    end
    unless is_valid_length? params[:employee] # if is_valid_length? returns false, then this block will be executed.
      redirect_to home_path, error: "Please enter a minimum of 4 characters"
      return
    end
    unless has_only_letters? params[:employee]
      redirect_to home_path, error: "Please enter only letters"
      return
    end
  end

  def employee_any? employee_name
    @searched_employee = Employee.where("lower(name) LIKE ?", "%#{params[:employee].downcase}%")
  end

  def is_valid_length? employee_name
    employee_name.length > 3 && employee_name.length < 100
  end

  def has_only_letters? employee_name
    employee_name.match(/^[A-z][a-z]+$/i)
  end
end
