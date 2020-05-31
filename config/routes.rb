Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "search#new"
  get "/search", to: "search#index"

  get '/profile', to: 'users#show'
  patch '/profile', to: 'users#update'
  get '/profile/edit', to: 'users#edit'
  delete '/logout', to: 'sessions#destroy'

  namespace :user do
    get '/messages', to: "messages#index"
  end
  resources :gear_items, only: %w[show]

  get '/auth/google_oauth2', as: 'google_login'
  get '/auth/google_oauth2/callback', to: 'sessions#new'
  get '/auth/failure', to: redirect('/')
end
