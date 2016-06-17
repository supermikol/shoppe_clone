require 'rails_helper'

RSpec.feature "Categories", type: :feature, js: true do
  context 'admin' do

    before do
      User.create(email: "user@user.com", password: "111111111", admin: true)
      Category.create(name: "Dogfish")
      category = Category.create(name: "Catfish")
      animal = Animal.create(name: "Robot", species: "Dog", details: "Something", quantity: rand(1..5), price: rand(1..50))
      category.animals << animal
      visit root_path
      click_link "Login"
      fill_in "Email", with: "user@user.com"
      fill_in "Password", with: "111111111"
      click_button "Log in"
    end

    it 'can see the page title' do
      visit categories_path
      expect(page).to have_content('Admin Index')
    end

    describe 'create things and have them render on the page' do
      it 'category' do
        visit categories_path
        click_link "Add New Category"
        fill_in 'Name', with: 'Fish'
        click_button 'Submit'
        expect(page).to have_content('Fish')
      end

      it 'animal' do
        visit categories_path
        click_link "Add Animal"
        fill_in "Name", with: "Jamie"
        fill_in "Species", with: "Crustacean"
        fill_in "Details", with: "He's 4 years old!"
        check 'animal_category_ids_2'
        fill_in "Quantity", with: "5"
        fill_in "Price", with: "30"
        click_button 'Create Animal'
        expect(page).to have_content('Jamie')
        click_link "Dogfish"
        expect(page).to_not have_content('Jamie')
        click_link "Catfish"
        expect(page).to have_content('Jamie')
      end
    end

    describe 'edit things and have the changes render on the page' do
      it 'category' do
        visit categories_path
        click_link "Catfish"
        click_link "Edit Category"
        fill_in 'Name', with: 'Hamsterfish'
        click_button 'Submit'
        expect(page).to have_content('Hamsterfish')
      end

      # FIX ALL THIS

      # it 'animal' do
      #   visit categories_path
      #   click_link "Catfish"
      #   click_link "edit_animal_#{Animal.first.id}"
      #   fill_in "Name", with: "Jamie"
      #   fill_in "Species", with: "Crustacean"
      #   fill_in "Details", with: "He's 4 years old!"
      #   check 'animal_category_ids_2'
      #   fill_in "Quantity", with: "5"
      #   fill_in "Price", with: "30"
      #   click_button 'Create Animal'
      #   expect(page).to have_content('Jamie')
      #   click_link "Dogfish"
      #   expect(page).to_not have_content('Jamie')
      #   click_link "Catfish"
      #   expect(page).to have_content('Jamie')
      # end
    end
  end
end














