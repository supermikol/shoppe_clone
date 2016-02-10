require 'rails_helper'

RSpec.feature "Categories", type: :feature, js: true do
  context 'a admin' do

    it 'can see the page title' do
      visit root_path
      expect(page).to have_content('Sea Animal Categories')
    end

    describe 'filling out a form' do
      it 'can submit a new category and see it rendered on the page' do
        visit new_category_path
        fill_in 'Name', with: 'Fish'
        click_button 'Create Category'
        expect(page).to have_content('Fish')
      end
    end

    describe 'editing an existing category' do
      it 'can fill out the form of the category and see the updated result' do

      end
    end

  end

end
