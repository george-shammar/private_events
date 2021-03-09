module UsersHelper
  def list_events events
    if events.empty?
      "You haven't created any events yet"
    else
      content_tag :ul, class: 'd-flex flex-column' do
        events.collect { |event| concat link_to event[0], event_path(event[1])  }
      end
    end 
  end

  def list_invitations invitations
    if invitations.empty?
      "You don't have any events "
    else
      content_tag :ul, class: 'd-flex flex-column' do
        invitations.collect { |invitation| concat link_to invitation[0], event_path(invitation[1])}
      end
    end
  end

end