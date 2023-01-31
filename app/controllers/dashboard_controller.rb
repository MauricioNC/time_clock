class DashboardController < ApplicationController
  before_action :authenticate, :set_current_employee

  def home
    @departments = Department.all
    @total_employees = Employee.all.count
  end

  def set_current_employee
    @current_employee = Employee.find(get_current_user)
  end
end
