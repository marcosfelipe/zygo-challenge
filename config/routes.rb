Rails.application.routes.draw do
  root to: "home#index"
  devise_for :users, path: '/'
  resources :books
  resources :favorite_books, only: [] do
    post ':book_id', action: :create, as: :create, on: :collection
    delete ':book_id', action: :destroy, as: :destroy, on: :collection
  end
end
