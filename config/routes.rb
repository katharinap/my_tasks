Rails.application.routes.draw do
  devise_for :users
  resources :tasks, except: %i[show edit new]
  resources :categories, except: %i[show edit new]
  root to: 'tasks#index'
end
