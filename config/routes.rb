Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  get 'users/show'
  root 'reviews#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
  end
  resources :users, only: [:show] do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
