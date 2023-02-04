class EmployeesController < ApplicationController
  before_action :authenticate, :set_current_employee

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)

    if @employee.save
      redirect_to root_path, success: "The employee #{@employee.name} was registered successfully."
    else
      render :new, error: @employee.errors.full_messages
    end
  end

  def analysis
    @disable_sidebar = true
    @employee = Employee.find_by(name: params[:employee_name])
    @employee_arrived_time = EmployeeSchedule.where(employee_id: @employee.id).first
  end

  def account
  end

  def settings
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :phone, :location, :address, :account_role, :department_id)
  end
end
