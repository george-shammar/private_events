class User < ApplicationRecord
  has_many :events, class_name: 'Event', foreign_key: 'creator_id'
  has_many :attendances, through: :invitations 
  
  def self.find_events_by_user(user)
    Event.where(creator_id: user.id)
         .pluck(:title, :id)
  end

end
