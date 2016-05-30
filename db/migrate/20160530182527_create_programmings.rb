class CreateProgrammings < ActiveRecord::Migration
  def change
    create_table :programmings do |t|
      t.string :day_month_week
      t.string :content_classes
      t.string :number_classes
      t.references :TeachingPlan, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
