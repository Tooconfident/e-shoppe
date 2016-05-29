Rails.application.routes.draw do
  get 'store/index'

  resources :products do
    collection do
      get 'admin'
    end
  end

  resources :categories, only: [:index, :show, :edit]

  resources :users do
    resources :carts, only: [:show, :edit, :update] do
      member do
        get 'thanks'
      end
      resources :orders, except: [:show, :index]
    end
  end

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'

  root 'store#index'
end
