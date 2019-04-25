Rails.application.routes.draw do
  root 'welcome#home'
  get '/signup' => 'players#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  get '/auth/facebook/callback' => 'session#facebook_session'
  post '/logout' => 'session#destroy'


  get '/sports' => 'sports#index'
  get '/positions' => 'positions#index'
  resources :positions
  resources :sports
  resources :players


resources :players do
  resources :positions, only: [:index, :show,:new, :edit]
  resources :sports, only: [:index, :show]
end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
