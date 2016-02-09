Rails.application.routes.draw do

  root 'navigation#home'

  resources :categories do
    resources :animals
  end

  # get 'sales', to: 'welcome#index'

end
