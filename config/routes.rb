Rails.application.routes.draw do

  resources :roles
  
  resources :users, only: [:index, :show]
  post 'users', to: "users#update_roles", as: "update_roles"

  resources :akts do
    get 'all', on: :collection
    get 'mine', on: :collection
  end

  resources :reminder_types
  resources :reminders
  resources :companies
  resources :types

  resources :contracts do
    member do
      post 'check_reminders'
    end
    post 'check_all_reminders'
    get 'all', on: :collection
    get 'mine', on: :collection
  end
  ### post '/contract/:id/check_reminders', to: "contracts#check_reminders", as: "check_reminders"

  resources :events do    
    get 'all', on: :collection
    get 'mine', on: :collection
  end
  resources :sessions

  get 'main', to: "main#show", as: 'main'


  root :to => "sessions#new"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
