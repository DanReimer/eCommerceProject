Rails.application.routes.draw do
  # get 'orders/show'
  root 'categories#index'
  resources :products, only: %i[show index]
  # resources :orders, only: :show
  resources :order_items, only: %i[create update destroy]

  get '/cart', to: 'orders#show'
  get '/checkout/address', to: 'orders#checkout_address'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: :show

  # get 'static_pages/about'

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
