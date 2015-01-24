Rails.application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :trips do
    member do
      post 'join_trip'
    end
  end
  
  get 'trip/:trip_code' => 'trips#share_show'
  
  root to: 'home#index'
  
  
end
