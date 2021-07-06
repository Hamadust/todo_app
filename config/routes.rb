Rails.application.routes.draw do
  root   'tasks#index'
  get    'signup',      to: 'users#new'
  get    '/login',      to: 'sessions#new'
  post   '/login',      to: 'sessions#create'
  delete '/logout',     to: 'sessions#destroy'
  post   '/change/:id', to: 'tasks#change'
  resources :tasks
  resources :users
end
