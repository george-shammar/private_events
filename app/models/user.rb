class User < ApplicationRecord
  has_many :events, foreign_key: 'creator_id', class_name: 'Event'

  def self.find_events_by_user(user)
    Event.where(creator_id: user.id)
         .pluck(:title, :id)
  end

end
