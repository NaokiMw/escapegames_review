Rails.application.routes.draw do
  get '/mypage' => 'users#mypage'
  get 'users/show'
  root 'reviews#index'
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
  end  
  
  resources :reviews do
    resource :favorites, only: [:create, :destroy]
  end
  resources :diaries
  resources :users do
    resource :relationships, only: [:create, :destroy]
    get :follows, on: :member
    get :followers, on: :member
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
