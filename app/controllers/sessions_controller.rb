class SessionsController < ApplicationController
  def new
    redirect_to home_path if !login? # login? returns 'session[:user_id].nil?' if true, then the user is not loged in, otherwise is log in

    @employee = Employee.new
  end

  def create
    pp params[:email]
    @employee = Employee.find_by_email(params[:email])

    if @employee&.authenticate(params[:password])
      session[:user_id] = @employee.id
      redirect_to root_path, success: "Welcome back!! #{@employee.name}"
    else
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
