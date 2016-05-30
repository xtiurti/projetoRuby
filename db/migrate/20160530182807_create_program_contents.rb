class CreateProgramContents < ActiveRecord::Migration
  def change
    create_table :program_contents do |t|
      t.integer :item
      t.text :ement
      t.text :content
      t.references :discipline, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
