class CreateTeachingPlans < ActiveRecord::Migration
  def change
    create_table :teaching_plans do |t|
      t.string :teacher
      t.string :team
      t.string :semester
      t.text :evaluation
      t.text :references
      t.text :guidelines
      t.references :discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
