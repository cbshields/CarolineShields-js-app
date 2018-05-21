Rails.application.routes.draw do
  root 'players#index'
  get '/login' => 'session#new'
  post '/login' => 'session#create'
  post '/logout' => 'session#destroy'
  resources :postitons
  resources :sports
  resources :players


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
