Rails.application.routes.draw do
  resources :genres
  resources :publishers
  resources :authors
  resources :books
  root to: 'books#index'
end
