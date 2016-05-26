class CreateDisciplines < ActiveRecord::Migration
  def change
    create_table :disciplines do |t|
      t.string :name
      t.string :cod
      t.integer :period
      t.integer :matrix
      t.string :course
      t.string :substantiation
      t.string :goals
      t.string :ement
      t.integer :at
      t.integer :ap
      t.integer :aps
      t.string :ad
      t.string :integer
      t.integer :apcc

      t.timestamps null: false
    end
  end
end
