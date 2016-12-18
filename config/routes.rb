Rails.application.routes.draw do


  get 'orders', to: 'orders#index'
  get 'orders/:id', to: 'orders#show'
  post 'create_order', 'to': 'orders#create', as: 'create_order'

  get 'cart', to: 'shopping_carts#show', as: :cart

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
  # ActiveAdmin.routes(self)

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
  root 'static_pages#home'
end
