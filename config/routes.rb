Rails.application.routes.draw do
  resources :tasks, only: %i[index create update]
  resources :categories, only: %i[create]
  root to: 'tasks#index'
end
