require 'rails_helper'

RSpec.describe Invitation, type: :model do
  it 'retrieves a list of innvitees for an event' do
    @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2021-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @invitee.id)
    @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
    invitees = Invitation.list_invitees(@birthday)
    expect(invitees.last).to eq(@invitee.id)
  end

  it 'returns the name of invitees of an event' do
    @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2021-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @invitee.id)
    @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
    invitees_list = Invitation.list_invitees(@birthday)
    invitees = Invitation.name_invitees(invitees_list)
    expect(invitees.last).to eq(@invitee.name)
  end

  it 'returns a list of previously attended events of a user' do
    @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @invitee.id)
    @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
    past_events = Invitation.list_past_invitations(@invitee)
    expect(past_events.last[0]).to eq('Birthday')
  end

  
  it 'returns a list of upcoming events of a user' do
    @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2022-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @invitee.id)
    @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id)
    upcoming_events = Invitation.list_upcoming_invitations(@invitee)
    expect(upcoming_events.last[0]).to eq('Birthday')
  end
end
