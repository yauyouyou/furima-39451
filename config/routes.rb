Rails.application.routes.draw do
  devise_for :users
  get'items',to:'items#index'
  post'items',to:'items#create'
  root to: 'items#index'
end