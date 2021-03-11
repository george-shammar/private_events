class SessionsController < ApplicationController
  def new; end

  def create
    @user = User.find_by_email(params[:email])
    if @user
      session[:user_id] = @user.id
      redirect_to @user
    else
      redirect_to login_path
      flash.alert = 'User not found.'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
