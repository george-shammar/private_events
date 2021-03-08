class User < ApplicationRecord
has_many :events, class_name: 'Event'
has_many :invitations
has_many :attended_events, through: :invitations, source: :event

# def self.find_events_by_user(user)
# Event.where(creator_id: user.id)
# .pluck(:title, :id)
# end

end
