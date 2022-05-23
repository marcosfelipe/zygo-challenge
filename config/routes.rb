Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, path: '/'
  resources :books
end
