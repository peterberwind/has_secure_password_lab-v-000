class SessionsController < ApplicationController

  def new
  end

  def create
    # find the user in the database
    user = User.find_by(name: params[:user][:name])
    user = user.try(:authenticate, params[:user][:password])
    return redirect_to(controller: 'sessions', action: 'new') unless user
    session[:user_id] = user.id
    @user = user
    redirect_to users_welcome_path
  end

  def destroy
    session.delete :name
    redirect_to sessions_new_path
  end

end