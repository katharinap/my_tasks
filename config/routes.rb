Rails.application.routes.draw do
  resources :tasks, only: %i[index create]
  resources :categories, only: %i[create]
  root to: 'tasks#index'
end
