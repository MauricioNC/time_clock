class ChangeTypeOfCheckoutColumnFromEmployeeScheduleToDate < ActiveRecord::Migration[6.1]
  def change
    change_column(:employee_schedules, :checkout, :date, using: 'checkout::date')
  end
end
