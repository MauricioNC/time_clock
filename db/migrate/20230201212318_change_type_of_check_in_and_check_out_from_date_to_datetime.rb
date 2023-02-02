class ChangeTypeOfCheckInAndCheckOutFromDateToDatetime < ActiveRecord::Migration[6.1]
  def change
    change_column :employee_schedules, :check_in, :datetime
    change_column :employee_schedules, :checkout, :datetime
  end
end
