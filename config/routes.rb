Rails.application.routes.draw do
  get 'comments' => 'comments#index'
  get 'comments/show'
  get 'comments/new' => 'comments#new'
  #post 'comments/new' => 'comments#create'
  post '/comments' => 'comments#create'
  # resources :comments
  devise_for :users
  resources :users
  resources :forums
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'forums#index'
  # Defines the root path route ("/")
  # root "articles#index"
end
