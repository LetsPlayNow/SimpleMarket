Rails.application.routes.draw do
  resources :orders, :only => [:index, :create, :show]

  resource :shopping_carts, :only => [:show]
  post 'cart/del_item/:id', to: 'shopping_carts#delete_item', as: :delete_item
  post 'cart/add_item/:id', to: 'shopping_carts#add_item', as: :add_item

  resources :products, only: [:show]
  resources :categories, only: [:index, :show]

  #get 'info', to: 'static_pages#info', as: 'info'

  # Devise gem for users
  devise_for :users

  # Administrate gem
  namespace :admin do
    resources :users
    resources :categories
    resources :orders
    resources :products
    resources :purchases
    resources :shopping_carts

    root to: "users#index"
  end

  root to: 'categories#index'
end
