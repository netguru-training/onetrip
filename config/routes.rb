Rails.application.routes.draw do
  resources :tasks

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :trips
  resources :tasks
  
  get 'trip/:trip_code' => 'trips#share_show', as: 'share_trip'
  post 'trip/:trip_code' => 'trips#join_trip', as: 'join_trip'
  
  root to: 'home#index'
  
end
