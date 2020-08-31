Rails.application.routes.draw do

  root 'pages#index'

  resources :posts do
    resources :comments
  end

  resources :favorite_posts, only: [:index, :create, :destroy]

  resources :discard_posts, only: [:index, :update]
  
  devise_for :users

  devise_for :admins

  resources :admin, only: [:index]

  get 'tags/:tag', to: 'posts#index', as: :tag

  get 'persons/profile'

  get 'persons/profile', as: 'user_root'

  get 'about', to: 'pages#about'

end
