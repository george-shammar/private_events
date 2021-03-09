require 'rails_helper'

RSpec.describe EventsHelper, type: :system do
  describe 'index page' do
    it 'shows a list of past events' do
      @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
        time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: 1)
      visit root_path
      expect(page).to have_content('Birthday')
    end

    it 'shows a list of upcoming events' do
      @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2023-04-02',
        time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: 1)
      visit root_path
      expect(page).to have_content('Birthday')
    end
  end

  describe 'show page' do 
    it 'shows a list of invitees to an event' do 
      @invitee = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2021-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @invitee.id)
    @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id) 
     visit event_path(@birthday.id)
     expect(page).to have_content('Foo')
  end
  end
end
