Rails.application.routes.draw do
  get 'store/index'

  resources :products do
    collection do
      get 'admin'
    end
  end
  resources :carts

  resources :categories, only: [:index, :show, :edit]

  resources :users do
    resources :carts, only: [:show, :edit, :destroy, :update]
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'store#index'
end
