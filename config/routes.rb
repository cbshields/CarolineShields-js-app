Rails.application.routes.draw do
  root 'welcome#show'
  get '/signup' => 'players#new'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'

  get '/sports' => 'sports#index'
  get '/positions' => 'positions#index'
  resources :positions
  resources :sports
  resources :players


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
