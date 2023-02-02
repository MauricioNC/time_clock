class RenameCheckoutDateColumnToCheckout < ActiveRecord::Migration[6.1]
  def change
    rename_column :employee_schedules, :checkout_date, :checkout
  end
end
