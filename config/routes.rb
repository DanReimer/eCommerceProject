Rails.application.routes.draw do
  root 'static_pages#index'

  get 'static_pages/about'

  get '/signup', to: 'users#new'
  resources :users

  ActiveAdmin.routes(self)
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
