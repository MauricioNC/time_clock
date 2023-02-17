class EmployeeSchedulesController < ApplicationController
  include EmployeeSchedulesHelper

  def new
    @employee_schedule = EmployeeSchedule.new
  end

  def create
    @employee = Employee.find(employee_schedule_params[:id])

    validate_absence @employee.id

    @check_time = DateTime.now

    if params[:commit] == "Check in"
      check_in_validations
      check_in
      redirect_to checkin_path, success: "Check in registered at: #{@check_time}" if @employee_schedule.save
      return
    else
      check_out_validations
      check_out
      redirect_to checkin_path, success: "Check out registered at: #{@check_time}"
      return
    end

  rescue => e
    flash[:error] = e
    redirect_to checkin_path
  end

  def employee_arrived
    @employee.employee_schedules.last.nil? == false && @employee.employee_schedules.last.check_in.to_date == @check_time.to_date
  end

  def check_in
    @employee_schedule = @employee.employee_schedules.new(check_in: @check_time)
  end

  def check_out
    @employee_schedule = @employee.employee_schedules.last.update(checkout: @check_time)
  end

  def check_in_validations
    return true unless employee_arrived
    raise "#{@employee.name}, you completed your schedule for today, please come back tommorrow!" if employee_arrived && @employee.employee_schedules.last.checkout.nil? == false
    raise "#{@employee.name}, you can't check in again without a check out first" if employee_arrived
  end

  def check_out_validations
    raise "#{@employee.name}, you completed your schedule for today, please come back tommorrow!" if employee_arrived && @employee.employee_schedules.last.checkout.nil? == false
    raise "#{@employee.name}, you cannot check out if you don't check in first, please check in." unless employee_arrived
  end

  private

  def employee_schedule_params
    params.require(:employee_schedule).permit(:id, :commit)
  end
end
