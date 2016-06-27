class CreateExceptionalDates < ActiveRecord::Migration
  def change
    create_table :exceptional_dates do |t|
      t.date :date_exception
      t.string :event

      t.timestamps null: false
    end
  end
end
