class Animal < ActiveRecord::Base
  belongs_to :category
  validates_presence_of :name, :species, :details, :price, :quantity
end
