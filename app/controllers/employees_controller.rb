class EmployeesController < ApplicationController
  before_action :authenticate, :set_current_employee

  def index
    @employees = Employee.all.order(created_at: :ASC)
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

  def edit
    @employee = Employee.find(params[:id])
  end

  def update
    @employee = Employee.find(params[:id])
    if @employee.update(employee_params)
      # request.env["HTTP_REFERER"] stores the path from the update method was called
      redirect_to request.env["HTTP_REFERER"], success: "Employee updated successfully"
      return
    else
      redirect_to edit_employee_path(@employee.id), error: "Something went wrong pleas try again."
    end
  end

  def destroy
    if Employee.find(params[:id]).delete
      redirect_to employees_path, success: "Employee deleted successfully."
      return
    else
      redirect_to employees_path, error: "Error deleting the employees with id #{params[:id]}"
    end
  end

  def analysis
    @disable_sidebar = true
    @employee = Employee.find_by(name: params[:employee_name])
    @employee_arrived_time = EmployeeSchedule.where(employee_id: @employee.id).first
  end

  def account
    @employee = Employee.find(@current_employee.id)
  end

  def settings
    @disable_sidebar = true
  end

  private

  def employee_params
    params.require(:employee).permit(:name, :email, :password, :password_confirmation, :phone, :location, :address, :account_role, :department_id)
  end
end
