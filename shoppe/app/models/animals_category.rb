class AnimalsCategory < ActiveRecord::Base
  belongs_to :category
  belongs_to :animal
end
