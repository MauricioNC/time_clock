class Absence < ApplicationRecord
  belongs_to :employee, foreign_key: "employee_id"

  def self.create
    today_date = Date.today.to_time
    @employees_employee_schedule = Employee.joins(:employee_schedules).where.not("check_in >= ?", today_date).distinct

    @employees_employee_schedule.each do |employee|
      if employee.absences.empty?
        @absence_employee = employee.absences.new(date_of_absence: today_date)
        unless @absence_employee.save
         return "Something went wrong registering absences."
        end
      end
    end
    "All the absences were registered successfully at #{today_date}"
  end
end
