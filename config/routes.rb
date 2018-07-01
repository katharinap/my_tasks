Rails.application.routes.draw do
  resources :tasks, only: %i[index]
  root to: 'tasks#index'
end
