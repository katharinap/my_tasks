Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: %i[show edit new]
  resources :categories, only: %i[create]
  root to: 'tasks#index'
end
