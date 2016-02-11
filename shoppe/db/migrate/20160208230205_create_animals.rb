class CreateAnimals < ActiveRecord::Migration
  def change
    create_table :animals do |t|
      t.string :name
      t.string :species
      t.string :img_url
      t.text :details
      t.integer :quantity
      t.float :price
      t.timestamps null: false
    end
  end
end
