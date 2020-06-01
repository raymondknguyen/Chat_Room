class UsersController < ApplicationController

  def show
  end

  def edit
  end

  def update
    user = current_user
    user.update(profile_picture: params[:profile_picture])
    user.update(about_me: params[:about_me])
    user.update(age: params[:age])
    user.save
    redirect_to ('/profile')
  end

end
