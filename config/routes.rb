Rails.application.routes.draw do
  get 'orders', to: 'orders#index'
  get 'orders/:id', to: 'orders#show'
  post 'create_order', 'to': 'orders#create', as: 'create_order'

  get 'cart', to: 'shopping_carts#show', as: :cart
  post 'cart/delete_purchase/:id', to: 'shopping_carts#delete_item', as: :delete_item


  post 'products/:id', to: 'products#add_to_cart', as: 'add_to_cart'
  resources :products, only: [:show]
  resources :categories, only: [:show]

  get 'home', to: 'static_pages#home', as: 'home'
  get 'info', to: 'static_pages#info', as: 'info'

  devise_for :users

  namespace :admin do
    resources :users
    resources :categories
    resources :orders
    resources :products
    resources :purchases
    resources :shopping_carts

    root to: "users#index"
  end

  root 'static_pages#home'
end
