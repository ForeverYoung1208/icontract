Rails.application.routes.draw do

  resources :companies
  resources :types
  resources :contracts

  resources :sessions

  get 'main', to: "main#show", as: 'main'
  # get 'sessions/create'
  # get 'sessions/destroy'

  root :to => "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
