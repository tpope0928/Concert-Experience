Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  get '/auth/spotify/callback', to: 'users#spotify'
  
  resources :concerts do
    resources :experiences, only: [:new, :index, :create, :show]
  end

  resources :experiences, only: [:index, :show, :new, :create]
  resources :artists
  
  resources :users do
    resources :concerts, only: [:index, :show, :new, :create]
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
