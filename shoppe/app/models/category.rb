class Category < ActiveRecord::Base
  has_many :animals, dependent: :destroy
  validates_presence_of :name
end
