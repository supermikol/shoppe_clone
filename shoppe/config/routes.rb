Rails.application.routes.draw do

  root 'navigation#home'

  scope '/admin' do
    resources :categories do
      resources :animals
    end
  end

  get 'categories/:id', to: 'navigation#categories'

end
