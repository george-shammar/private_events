require 'rails_helper'

RSpec.describe User, type: :model do
  creator = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
  
  it 'retrieves all the events created by a user' do
    @event = creator.events.build(title: 'Birthday', location: 'Foo City', date: '2021-04-02',
                                time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthdayy')
    events = User.find_events_by_user(creator)
    expect(events.all? { |event| event[0].is_a?(String) }).to be true
    expect(events.all? { |event| event[1].is_a?(Integer) }).to be true
  end


  it 'retrieves all invitations a user has' do 
    @event = creator.events.build(title: 'Birthday', location: 'Foo City', date: '2021-04-02',
                                time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthdayy')
    @invitation = @event.invitations.build(invitee_id: creator.id)
    invitations = User.find_invitations_by_user(creator)
    expect(invitations[0]).to equal(@event.id) 
  end
end
