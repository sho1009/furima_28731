Rails.application.routes.draw do
  devise_for :users
  root to: 'products#index'
  resources :products, only: [:index, :new, :create, :destroy, :edit]
  # root to: 'articles#index'
  # resources :articles
  resources :users, only: :show

end
