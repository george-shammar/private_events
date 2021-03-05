class Invitation < ApplicationRecord
  belongs_to :invitee, class_name: 'User'
  belongs_to :event, class_name: 'Event'
end
