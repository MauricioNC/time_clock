  module EmployeeSchedulesHelper
  def validate_absence(employee_id)
    today_date = Date.today.to_time
    @absences = @employee.absences.where("date_of_absence >= ?", today_date).count
    return @absences > 0 ? true : false
  end
end
