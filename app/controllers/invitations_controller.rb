class InvitationsController < ApplicationController
  def new
    @current_event = Event.find(params[:id])
    @invitation = @current_event.invitations.build
  end

  def create
    @current_event = Event.find(params[:id])
    @email = invitation_params[:email]
    @user = User.where(email: @email).pluck(:id)
    @invitation = @current_event.invitations.build(invitee_id: @user[0])
    if @invitation.save
      redirect_to event_path(@current_event.id)
    else
      render :new
    end
  end

  private

  def invitation_params
    params.permit(:email, :authenticity_token, :commit, :id)
  end
end
