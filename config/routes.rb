Rails.application.routes.draw do
  get '/mypage' => 'users#mypage'
  get 'users/show'
  root 'homes#index'
  post '/homes/guest_sign_in', to: 'homes#guest_sign_in'
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    omniauth_callbacks: 'users/omniauth_callbacks'
  }
  devise_scope :user do
    get '/users/sign_out' => 'devise/sessions#destroy'
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
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
  resources :tags, only: [:index, :show, :destroy]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
