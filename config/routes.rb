Rails.application.routes.draw do
  resources :organizations
  resources :users
  resources :permissions

  resources :labs
  resources :courses

  root to: "home#index"
end
