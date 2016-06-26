class AddPeriodToTeachingPlan < ActiveRecord::Migration
  def change
    add_column :teaching_plans, :start, :date
    add_column :teaching_plans, :end, :date
  end
end
