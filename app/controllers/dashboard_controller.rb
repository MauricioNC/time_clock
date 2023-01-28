class DashboardController < ApplicationController
  before_action :authenticate, :set_current_employee

  def home
  end

  def set_current_employee
    @current_employee = Employee.find(get_current_user)
  end
end
