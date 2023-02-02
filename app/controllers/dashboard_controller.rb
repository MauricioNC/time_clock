class DashboardController < ApplicationController
  include EmployeesHelper

  before_action :authenticate, :set_current_employee
  before_action :validate_employee_searched, only: [:searcher]

  def home
    @departments = Department.all
    @total_employees = Employee.all.count
  end

  def searcher
    @searched_employee
  end
end
