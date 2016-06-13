class ChangeColumnNumberClasses < ActiveRecord::Migration
  def up
    change_column :programmings, :number_classes, :integer
  end
end
