Rails.application.routes.draw do

  get 'pages/home',to:'pages#home'
  get 'users/account'
  get 'users/profile'
  devise_for :users 
  devise_scope :user do
    get 'signin' => 'devise_token_auth/sessions#new'
    post 'signin' => 'devise_token_auth/sessions#create'
    post 'signup' => 'users#create'
    get "users/show" => "users#show"
  end
  resources :user, only: [:edit, :update]

  root 'pages#home'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  

end
