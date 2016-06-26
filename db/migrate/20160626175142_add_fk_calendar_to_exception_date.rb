class AddFkCalendarToExceptionDate < ActiveRecord::Migration
  def change
    add_reference :exceptional_dates, :calendars, index: true
  end
end
