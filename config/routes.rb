Rails.application.routes.draw do
  devise_for :users
  resources :todos
  get 'pages/index'
  get 'pages/show'

  root 'pages#index'
end
