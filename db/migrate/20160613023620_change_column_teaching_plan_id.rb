class ChangeColumnTeachingPlanId < ActiveRecord::Migration
  def up
    rename_column :programmings, :TeachingPlan_id, :teaching_plan_id
    rename_column :teaching_procedures, :TeachingPlan_id, :teaching_plan_id
  end
end
