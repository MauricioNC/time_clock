class EmployeesController < ApplicationController
  def new
    @employee = Employee.new
  end

  def create
    department = Department.find_by(department: params[])
  end
end
