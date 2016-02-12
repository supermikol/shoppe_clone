class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.references :animal, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :item_quantity, null: false
      t.boolean :checked_out, default: false
      t.datetime :checkout_date
      t.integer :order_num
      t.text :address

      t.timestamps null: false
    end
  end
end
