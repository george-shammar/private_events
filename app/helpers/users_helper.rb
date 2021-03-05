module UsersHelper
  def list_events events
    content_tag :ul, class: 'd-flex flex-column' do
      events.collect { |event| concat link_to event[0], event_path(event[1])  }
    end
  end
end