Rails.application.routes.draw do

  resources :users, only: [ :show ]
  resources :tasks
  resources :trips do
    member do
      post 'mark_as_done'
    end
  end
    

  get 'trip/:trip_code' => 'trips#share', as: 'share_trip'
  post 'trip/:trip_code' => 'trips#join_trip', as: 'join_trip'

  post 'trip_memberships/:id/accept' => 'trip_memberships#accept', as: 'accept_trip_membership'
  post 'trip_memberships/:id/reject' => 'trip_memberships#reject', as: 'reject_trip_membership'

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }
  
  root to: 'trips#index'
  
end
