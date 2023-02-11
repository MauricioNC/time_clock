class RemoveLunchFromEmployeeSchedules < ActiveRecord::Migration[6.1]
  def change
    remove_column :employee_schedules, :lunch
  end
end
