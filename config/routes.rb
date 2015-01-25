Rails.application.routes.draw do

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :trips do
    member do
      post 'mark_as_done'
    end
  end

  resources :tasks

  get 'trip/:trip_code' => 'trips#share', as: 'share_trip'
  post 'trip/:trip_code' => 'trips#join_trip', as: 'join_trip'

  post 'trip_memberships/:id/accept' => 'trip_memberships#accept', as: 'accept_trip_membership'
  post 'trip_memberships/:id/reject' => 'trip_memberships#reject', as: 'reject_trip_membership'

  root to: 'home#index'

end
