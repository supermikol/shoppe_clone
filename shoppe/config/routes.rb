Rails.application.routes.draw do

  devise_for :users
  root 'navigation#home'

  scope '/admin' do
    resources :categories, :animals
  end

  resources :orders

  get "/checkout", to: "orders#checkout_complete"
  put '/checkout', to: 'orders#checkout'

  get 'categories/all', to: 'navigation#all'
  get 'categories/:id', to: 'navigation#categories'
  get 'cart', to: 'navigation#cart'
  post 'order/:id', to: 'navigation#add_to_cart'
  get 'profile', to: 'navigation#profile'
  get 'history/:id', to: 'orders#view'

end
