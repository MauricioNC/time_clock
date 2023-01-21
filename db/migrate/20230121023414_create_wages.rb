class CreateWages < ActiveRecord::Migration[6.1]
  def change
    create_table :wages do |t|
      t.datetime :hire_date
      t.integer :salary
      t.integer :hrs_worked

      t.timestamps
    end
  end
end
