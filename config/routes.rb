Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :waters, only: [:show, :index] do
    resources :reviews, only: :create
  end
  resources :logs, only: :index
  resources :reviews, only: :destroy
end
