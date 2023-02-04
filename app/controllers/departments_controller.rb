class DepartmentsController < ApplicationController
  before_action :authenticate

  def new
    @department = Department.new
  end
end
