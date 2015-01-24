Rails.application.routes.draw do

  resources :trips
  
  root to: 'home#show'
  
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
end
