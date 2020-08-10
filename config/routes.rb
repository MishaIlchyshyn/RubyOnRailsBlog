Rails.application.routes.draw do

  root 'pages#index'

  resources :posts do
    resources :comments
  end
  
  devise_for :users

  get 'persons/profile'

  get 'persons/profile', as: 'user_root'

  get 'about', to: 'pages#about'

end
