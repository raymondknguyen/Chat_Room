Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/profile', to: 'users#show'

  namespace :user do
    get '/messages', to: "messages#index"
  end

end
