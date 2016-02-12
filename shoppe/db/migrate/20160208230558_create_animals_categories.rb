class CreateAnimalsCategories < ActiveRecord::Migration
  def change
    create_table :animals_categories do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end

    add_index :animals_categories, [:animal_id, :category_id], unique: true
  end
end

