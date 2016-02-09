require 'rails_helper'

RSpec.describe CategoriesController, type: :controller do

  describe 'index action' do

    before do
      @all_categories = 3.times.map do
        Category.create(name: 'Fish')
      end
    end

    it 'should load all categories' do
      get :index

      expect(assigns[:categories]).to eq @all_categories
      expect(response.status).to eq 200
      expect(response).to render_template(:index)
    end
  end

  describe 'create action' do
    context 'when given valid params' do
      let :category_params do
        {name: 'Fish'}
      end
      it 'should create the post and redirect to the posts index page' do
        expect{
          post :create, category: category_params
          }.to change{ Category.count }.by(1)
          expect(response).to redirect_to("/categories/#{Category.last.id}")
        end
      end
      context 'when given invalid params' do
        let :category_params do
          {name: ''}
        end
        it 'should not create the post and re-render the new page' do
          expect{ post :create, category: category_params }.to_not change{ Category.count }
        end
      end
    end

    describe 'update action' do
      let(:new_category) {Category.create(name: 'Tripod')}
      let :valid_category_params do
        {name: 'Quadpod'}
      end
      let :invalid_category_params do
        {name: ''}
      end
      context 'when given valid params' do
        it 'should update the post and redirect to the posts index page' do
          put :update, id: new_category.id, category: valid_category_params
          expect(new_category.reload.name).to eq('Quadpod')
          expect(response).to redirect_to("/categories/#{new_category.id}")
        end
      end
      context 'when given invalid params' do
        it 'should not update the post and re-render the update page' do
          put :update, id: new_category.id, category: invalid_category_params
          expect(new_category.reload.name).to eq('Tripod')
          expect(response).to render_template(:edit)
        end
      end
    end

    describe 'delete action' do
      let(:new_category) {Category.create(name: 'Tripod')}
      it 'decrements categories by one' do
        new_category_id = new_category.id
        expect {
          delete :destroy, id: new_category_id
        }.to change {Category.count}.by(-1)
      end
      it 'redirects to the root path' do
        new_category_id = new_category.id
        delete :destroy, id: new_category_id
        expect(response).to redirect_to("/categories")
      end
    end

  end
