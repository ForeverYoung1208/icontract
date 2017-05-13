Rails.application.routes.draw do

  resources :companies
  resources :types
  resources :contracts

  get 'session/new'
  get 'session/create'
  get 'session/destroy'

  root :to => "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
