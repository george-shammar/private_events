require 'rails_helper'

include UsersHelper
RSpec.describe UsersHelper, type: :helper do
  creator = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
  @event = creator.events.build(title: 'Birthday', location: 'Foo City', date: '2021-04-02', time: "2000-01-01 14:22:00.000000000 +0000")
  it 'retrieves all the events created by a user' do
    events = find_events_by_user(creator)
    expect(events.all? { |event| event.user === creator }).to be true
    end
  it '' 

end