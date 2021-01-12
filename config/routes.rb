Rails.application.routes.draw do
  resources :events
  resources :users
  resources :sessions

  get 'logout' => 'sessions#destroy', as: 'logout'
  
  root 'users#index'
end
