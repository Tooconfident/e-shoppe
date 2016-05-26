Rails.application.routes.draw do
  get 'store/index'
  resources :products do
    collection do
      get 'admin'
    end
  end
  resources :carts

  resources :categories, only: [:index, :show, :edit]

  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  # get '/categories' => 'categories#index'
  # get '/categories/:id' => 'categories#show', as: 'category'



  root 'store#index'
end
