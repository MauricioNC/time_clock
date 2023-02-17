class CreateAbsences < ActiveRecord::Migration[6.1]
  def change
    create_table :absences do |t|
      t.datetime :date_of_absence

      t.timestamps
    end
  end
end
