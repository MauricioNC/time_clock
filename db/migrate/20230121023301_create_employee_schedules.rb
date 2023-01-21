class CreateEmployeeSchedules < ActiveRecord::Migration[6.1]
  def change
    create_table :employee_schedules do |t|
      t.date :check_in
      t.string :checkout_date
      t.time :lunch

      t.timestamps
    end
  end
end
