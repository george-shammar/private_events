class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invitations
  has_many :invitees, through: :invitations, source: :invitee

  scope :past_events, -> { where( 'date < ?', DateTime.now) }
  scope :upcoming_events, -> { where( 'date > ?', DateTime.now) }
end

