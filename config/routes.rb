Rails.application.routes.draw do

  get '/', to: 'main#index'

  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/notification-settings', to: 'notifications#new'
  post '/notification-settings', to: 'notifications#edit'
end
