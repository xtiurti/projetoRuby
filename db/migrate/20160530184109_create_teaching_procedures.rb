class CreateTeachingProcedures < ActiveRecord::Migration
  def change
    create_table :teaching_procedures do |t|
      t.text :theoretical_classes
      t.text :practical_classes
      t.text :aps
      t.text :activies_distance
      t.text :apcc
      t.references :TeachingPlan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
