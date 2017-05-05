Rails.application.routes.draw do
  resources :companies
  resources :types
  resources :contracts
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
