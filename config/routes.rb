Rails.application.routes.draw do
  root   'sessions#new'
  get    'signup',      to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
  get    '/index',      to: 'tasks#index'
  post   '/change/:id', to: 'tasks#change'
  resources :tasks
  resources :users
end
