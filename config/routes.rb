Rails.application.routes.draw do
  root 'messages#index'
  get  'signup', to: 'users#new'
  resources :messages
  resources :users
end
