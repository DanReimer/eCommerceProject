Rails.application.routes.draw do
  root 'categories#index'
  resources :products, only: %i[show index]
  resources :order_items, only: %i[create update destroy]

  get '/cart', to: 'orders#show'
  get '/checkout', to: 'orders#checkout'
  patch '/placeorder', to: 'orders#place_order'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users, only: %i[show edit update]

  # get 'static_pages/about'

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
