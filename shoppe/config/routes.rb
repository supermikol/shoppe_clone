Rails.application.routes.draw do

  devise_for :users
  root 'navigation#home'

  scope '/admin' do
    resources :categories, :animals
  end

  get 'categories/all', to: 'navigation#all'
  get 'categories/:id', to: 'navigation#categories'

end
