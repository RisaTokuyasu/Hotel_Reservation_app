Rails.application.routes.draw do
  get 'users/index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  devise_scope :user do
    get 'signin' => 'devise_token_auth/sessions#new'
    post 'signin' => 'devise_token_auth/sessions#create'
    post 'signup' => 'users#create'
    put 'update' => 'users#update'
  end
  
  root 'pages#home'

 devise_for :users, controllers: {
   confirmations: 'users/confirmations',
   passwords:     'users/passwords',
   registrations: 'users/registrations',
   sessions:      'users/sessions',
 }
end
