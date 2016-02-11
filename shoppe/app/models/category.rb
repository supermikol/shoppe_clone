class Category < ActiveRecord::Base
  has_many :animals_categories
  has_many :animals, through: :animals_categories
  validates_presence_of :name
end
