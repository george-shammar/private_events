class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  has_many :invitees, through: :invitations, source: :invitee_id
end
