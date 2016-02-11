class Animal < ActiveRecord::Base
  has_many :animals_categories
  has_many :categories, through: :animals_categories
  validates_presence_of :name, :species, :details, :price, :quantity
end
