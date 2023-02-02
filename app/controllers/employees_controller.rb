class EmployeesController < ApplicationController
  before_action :authenticate, :set_current_employee

  def analysis
    @disable_sidebar = true
    @employee = Employee.find_by(name: params[:employee_name])
    @employee_arrived_time = EmployeeSchedule.where(employee_id: @employee.id).first
  end
end
