Rails.application.routes.draw do
  devise_for :users
  # post'items',to:'items#create'
  root 'items#index'
  resources :items do
    resources :orders, only: [:index, :create]
  end
end 