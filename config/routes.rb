Rails.application.routes.draw do

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/notification-settings', to: 'notifications#new'
  post '/users/notifications-settings', to: 'notifications#edit'
end
