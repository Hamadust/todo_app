Rails.application.routes.draw do
  root   'messages#index'
  get    'signup',   to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :messages
  resources :users
end
