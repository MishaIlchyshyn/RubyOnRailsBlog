Rails.application.routes.draw do

  root 'pages#index'

  resources :posts do
    resources :comments
  end

  resources :favorite_posts, only: [:index, :create, :destroy]

  resources :discard_posts
  
  devise_for :users

  get 'tags/:tag', to: 'posts#index', as: :tag

  get 'persons/profile'

  get 'persons/profile', as: 'user_root'

  get 'about', to: 'pages#about'

end
