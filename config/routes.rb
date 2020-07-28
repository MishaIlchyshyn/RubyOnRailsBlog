Rails.application.routes.draw do
  
  devise_for :users
  get 'persons/profile'
  root 'pages#index'

  get 'about', to: 'pages#about'

  get 'persons/profile', as: 'user_root'

  resources :posts

end
