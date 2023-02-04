class DepartmentsController < ApplicationController
  before_action :authenticate

  def new
    @department = Department.new
  end

  def create
    @department = Department.new(department_params)

    if @department.save
      redirect_to root_path, success: "The department #{@department.department} was created successfully."
    else
      render :new, error: @department.error.full_messages
    end
  end

  private

  def department_params
    params.require(:department).permit(:department, :manager)
  end
end
