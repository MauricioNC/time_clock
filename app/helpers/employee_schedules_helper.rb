module EmployeeSchedulesHelper
  def validate_absence employee_id
    today_date = Date.today.to_time
    @absences = @employee.absences.where("date_of_absence >= ?", today_date).count
    if @absences > 0
      redirect_to check_in_path, error: "You cannot check in because the max time to check in is 9:15"
    end
  end
end
