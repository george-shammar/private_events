class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :invitations
  has_many :attended_events, through: :invitations, source: :event

  def self.find_events_by_user(user)
    Event.where(creator_id: user.id)
      .pluck(:title, :id)
  end

  def self.find_invitations_by_user(user)
    Invitation.where(invitee_id: user.id).pluck(:event_id)
  end
end
