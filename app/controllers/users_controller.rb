class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to new_user_path
      session[:current_user] = @user
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @user_events = User.find_events_by_user(@user)
    @past_invitations = Invitation.list_past_invitations(@user)
    @upcoming_invitations = Invitation.list_upcoming_invitations(@user)
    
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
