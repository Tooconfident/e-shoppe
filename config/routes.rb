Rails.application.routes.draw do
  get 'store/index'

  resources :products
  resources :carts

  root 'store#index'
end
