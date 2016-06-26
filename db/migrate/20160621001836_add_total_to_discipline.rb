class AddTotalToDiscipline < ActiveRecord::Migration
  def change
    add_column :disciplines, :total, :integer
  end
end
