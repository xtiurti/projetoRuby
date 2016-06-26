class CreateCalendars < ActiveRecord::Migration
  def up
    create_table :calendars do |t|
      t.string :description

      t.timestamps null: false
    end
  end
end
