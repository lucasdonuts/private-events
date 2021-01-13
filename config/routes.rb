Rails.application.routes.draw do
  resources :events, only: [:index, :new, :create, :show]
  resources :users
  resources :sessions, only: [:new, :create, :show, :destroy]

  get 'logout' => 'sessions#destroy', as: 'logout'
  
  root 'events#index'
end
