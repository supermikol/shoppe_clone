class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.text :details
      t.float :price
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
