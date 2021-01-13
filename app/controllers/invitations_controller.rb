class InvitationsController < ApplicationController
  def create
    @invitation = current_user.invitations.build(invitation_params)
  end

  def update

  end

  def destroy
    
  end

  def invitation_params
    params.require(:invitation).permit(:attendee_id, :event_id)
  end
end