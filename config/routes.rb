Rails.application.routes.draw do

  get '/' => 'sessions#welcome'
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/signup' => 'users#new'
  delete '/logout' => 'sessions#destroy'
  
  #Route for Edit and Update
  patch 'concerts/:id', to: 'concerts#update'

  get '/auth/:provider/callback' => 'sessions#omniauth'
  #get '/auth/spotify/callback', to: 'users#spotify'
  
  resources :concerts do
    resources :experiences
  end

  resources :experiences
  resources :artists
  
  resources :users do
    resources :concerts
  end
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
