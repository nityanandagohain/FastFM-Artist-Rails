Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # get '/' => 'session#index'
  # post '/sessions' => 'sessions#create'
  # post '/users' => 'users#create'
  get '/' => 'artists#index', as: 'home'
  post '/' => 'artists#create'

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  resources :users
  resources :sessions
  resources :artists
end
