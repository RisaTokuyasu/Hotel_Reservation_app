Rails.application.routes.draw do

  get 'users/account'
  devise_for :users
  devise_scope :user do
    get 'signin' => 'devise_token_auth/sessions#new'
    post 'signin' => 'devise_token_auth/sessions#create'
    post 'signup' => 'users#create'
    get "users/show" => "users#show"
  end
  resources :users, only: [:edit,:update]

  resources :rooms, only: [:index,:new,:show,:create] do
    collection do
      get 'home',to:'home'
      get 'search'
      post 'search'
    end
  end
  root 'rooms#home'


  resources :reservations, only:[:index, :new, :create, :show] do
    collection do
      post :confirm
    end
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
