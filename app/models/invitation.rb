class Invitation < ApplicationRecord
  belongs_to :invitee
  belongs_to :event
end
