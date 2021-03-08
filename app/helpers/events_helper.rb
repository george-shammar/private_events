module EventsHelper

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
