class CreateLessons < ActiveRecord::Migration[5.2]
  def change
    create_table :lessons do |t|
      t.string :title
      t.text :description
      t.references :category, foreign_key: true
      t.references :level, foreign_key: true
      t.references :chapter, foreign_key: true

      t.timestamps
    end
  end
end
