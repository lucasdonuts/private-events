class InvitationsController < ApplicationController
  def create
    @invitation = Invitation.new(event_id: params[:event_id], attendee_id: params[:attendee_id])

    if @invitation.save
      @invitation.invited!
      flash.notice = "Invitation Sent"
      redirect_to users_path(event_id: params[:event_id])
    else
      flash.alert = "An error occured"
      redirect_to users_path(event_id: params[:event_id])
    end
  end

  def update
    @invitation = Invitation.find_by(event_id: params[:event_id], attendee_id: current_user.id)

    if @invitation && @invitation.invited?
      @invitation.accepted!
    else
      flash.alert = "You have not been invited to this event"
    end
    redirect_to event_path(params[:event_id])
  end

  def destroy
    
  end

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :event_id)
  end
end