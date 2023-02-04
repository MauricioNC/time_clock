class ApplicationController < ActionController::Base

  add_flash_types :info, :error, :warning, :success

  def login?
    session[:user_id].nil?
  end

  def get_current_user
    session[:user_id]
  end

  def authenticate
    if login?
      redirect_to login_path, error: "Log in to access this page"
      return
    end
    set_current_employee
  end

  private

  def set_current_employee
    @current_employee = Employee.find(get_current_user)
  end
end
