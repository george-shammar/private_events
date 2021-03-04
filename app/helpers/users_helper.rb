module UsersHelper
  def find_events_by_user(user)
    Event.where(creator_id: user.id)
  end

  def list_events_by_user(user)
    find_events_by_user(user).find_each do |event|
      link_to event.title, event_path(event.id)
    end
  end
end
