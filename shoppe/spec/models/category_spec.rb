require 'rails_helper'

RSpec.describe Category, type: :model do
  let(:category_no_name) { Category.new() }
  let(:category) { Category.new(name: 'Amphibian') }

  describe 'validations' do

    it 'will raise an error when the name field is empty' do
      category_no_name.save
      expect(category_no_name.errors[:name]).to include("can't be blank")
    end

    it 'saves the category when the fields are not blank' do
      expect{category.save}.to change{Category.count}.by(1)
    end

  end
end
