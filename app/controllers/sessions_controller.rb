class SessionsController < ApplicationController

  def new
    google_info = request.env['omniauth.auth']
    user = User.from_omniauth(google_info)
    user.google_token = google_info.credentials.token
    refresh_token = google_info.credentials.refresh_token
    user.google_refresh_token = refresh_token if refresh_token.present?
    user.save
    session[:user_id] = user.id
    redirect_to '/profile'
  end

end
