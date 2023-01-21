class AddEmployeeToEmployeeSchedule < ActiveRecord::Migration[6.1]
  def change
    add_reference :employee_schedules, :employee, null: false, foreign_key: true
  end
end
