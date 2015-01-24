Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :trips
  get 'trip/:trip_code' => 'trips#share_show'
  
  root to: 'home#index'
end
