class Animal < ActiveRecord::Base
  has_many :animals_categories, dependent: :destroy
  has_many :categories, through: :animals_categories
  has_many :orders
  has_many :buyers, through: :orders, source: :user

  validates_presence_of :name, :species, :details, :price, :quantity

end
