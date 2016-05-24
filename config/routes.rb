Rails.application.routes.draw do
  get 'store/index'
  resources :products do
    collection do
      get 'admin'
    end
  end
  resources :carts

  root 'store#index'
end
