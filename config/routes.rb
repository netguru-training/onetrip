Rails.application.routes.draw do

  resources :messages

  devise_for :users, :controllers => { :omniauth_callbacks => "omniauth_callbacks" }

  resources :trips 
  resources :tasks

  get 'trip/:trip_code' => 'trips#share', as: 'share_trip'  
  get 'trips/:id/renew' => 'trips#renew', as: 'renew_trip'
  get 'users/my_trips' => 'trips#my_trips', as: 'my_trips'
  get 'my_messages' => 'messages#my_messages', as: 'my_messages'
  
  post 'trip/:task_id/:trip_code' => 'trips#mark_as_done', as: 'mark_as_done'
  post 'trip/:trip_code' => 'trips#join_trip', as: 'join_trip'

  post 'trip_memberships/:id/accept' => 'trip_memberships#accept', as: 'accept_trip_membership'
  post 'trip_memberships/:id/reject' => 'trip_memberships#reject', as: 'reject_trip_membership'
  
  root to: 'trips#index'
  
end
