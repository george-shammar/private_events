module EventsHelper
  def list_past_events events
    if events.empty?
      "There are no past events."
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.collect { |event| concat link_to event[0], event_path(event[1])  }
      end
    end 
  end

  def list_upcoming_events events
    if events.empty?
      "There are no upcoming events"
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.collect { |event| concat link_to event[0], event_path(event[1])  }
      end
    end 
  end

  def show_invitees invitees
    unless @invitees.empty?
      content_tag :ul, class: 'd-flex flex-column' do
      invitees.collect { |invitee| concat(content_tag(:li, invitee)) }
    end
    else
    "There are no invitees yet"
    end
  end 
 
end
