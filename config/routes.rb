Rails.application.routes.draw do
  resources :events do
    member do
      get 'attend'
    end
  end
  resources :users
  resources :sessions, only: [:new, :create, :show, :destroy]
  resources :invitations, only: [:create, :destroy, :update]

  get 'logout' => 'sessions#destroy', as: 'logout'
  
  root 'events#index'
end
