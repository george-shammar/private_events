module EventsHelper

  def show_invitees invitees
    unless @event_invitees.empty?
      content_tag :ul, class: 'd-flex flex-column' do
        invitees.collect { |invitee| concat(content_tag(:li, invitee[0])) }
      end
    else
      "There are no invitees yet"
    end
  end

end