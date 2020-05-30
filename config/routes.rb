Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "/", to: "search#new"
  get "/search", to: "search#index"

  get '/profile', to: 'users#show'

  namespace :user do
    get '/messages', to: "messages#index"
  end
  resources :gear_items, only: %w[show]

  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'sessions#new'
  # get '/auth/google_oauth2/callback', to: 'sessions#new'
  get '/auth/failure', to: redirect('/')
end
