class DashboardController < ApplicationController
  before_action :authenticate, :set_current_employee
  before_action :validate_employee_searched, only: [:searcher]

  def home
    @departments = Department.all
    @employees = Employee.all
  end

  def searcher
    @searched_employee
  end
end
