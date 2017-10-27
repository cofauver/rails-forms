Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/users/edit', to: 'users#edit'
  post '/users/edit', to: 'users#update'
end
