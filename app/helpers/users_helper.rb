module UsersHelper
  def list_events events
    content_tag :ul do
      events.collect { |event| concat link_to event[0], event_path(event[1])  }
    end
  end
end