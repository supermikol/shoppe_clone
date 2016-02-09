require 'rails_helper'

RSpec.describe Animal, type: :model do
  let(:animal_no_name) { Animal.new(species: 'clownfish', details: 'I am a fish', price: 10) }
  let(:animal_no_species) { Animal.new(name: 'nemo', details: 'I am a fish', price: 10) }
  let(:animal_no_details) { Animal.new(name: 'nemo', species: 'clownfish', price: 10) }
  let(:animal_no_price) { Animal.new(name: 'nemo', details: 'I am a fish', species: 'clownfish') }
  let(:animal) { Animal.new(name: 'nemo', details: 'I am a fish', species: 'clownfish', price: 10) }



  describe 'validations' do
    context 'will raise an error' do
      it 'when the name field is empty' do
        animal_no_name.save
        expect(animal_no_name.errors[:name]).to include("can't be blank")
      end
      it 'when the species field is empty' do
        animal_no_species.save
        expect(animal_no_species.errors[:species]).to include("can't be blank")
      end
      it 'when the details field is empty' do
        animal_no_details.save
        expect(animal_no_details.errors[:details]).to include("can't be blank")
      end
      it 'when the price field is empty' do
        animal_no_price.save
        expect(animal_no_price.errors[:price]).to include("can't be blank")
      end
    end
    it 'saves the animal when the fields are not blank' do
      expect{animal.save}.to change{Animal.count}.by(1)
    end
  end
end
