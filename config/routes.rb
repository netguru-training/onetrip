Rails.application.routes.draw do
  resources :trips
  
  post 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  delete 'signout', to: 'sessions#destroy', as: 'signout'
  
  devise_for :users

end
