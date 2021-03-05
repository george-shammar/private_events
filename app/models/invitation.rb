class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User'
  belongs_to :event, class_name: 'Event'

  def self.list_invitees(event)
    User.where( {id: self.invitee_list(event)} )
        .pluck(:name, :id)
  end

  def self.invitee_list(event)
    self.where(event_id: event.id)
    .pluck(:invitee_id)
  end

end


 