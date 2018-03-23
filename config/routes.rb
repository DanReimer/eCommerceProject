Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  root 'static_pages#index'

  # get 'static_pages/about'

  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'
  resources :users

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
