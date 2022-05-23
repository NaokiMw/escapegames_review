Rails.application.routes.draw do
  get 'users/show'
  root 'reviews#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
