class RemoveForeignKeyCalendar < ActiveRecord::Migration
  def change
    remove_column :exceptional_dates, :calendars_id
  end
end
