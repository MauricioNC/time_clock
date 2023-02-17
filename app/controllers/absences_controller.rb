class AbsencesController < ApplicationController
  protect_from_forgery with: :null_session
  def create
    today_date = Date.today.to_time
    @employees_employee_schedule = Employee.joins(:employee_schedules).where.not("check_in >= ?", today_date).distinct

    @employees_employee_schedule.each do |employee|
      @absence_employee = employee.absences.new(date_of_absence: today_date)
      unless @absence_employee.save
        redirect_to check_in_path, error: "Something went wrong registering absences."
      end
    end
    flash[:success] = "All the absences were registered successfully at #{today_date}"
  end
end
