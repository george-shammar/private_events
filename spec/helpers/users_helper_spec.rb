require 'rails_helper'

RSpec.describe UsersHelper, type: :system do
  describe 'users show page' do
    it 'shows a list of created events' do
      @user = User.first_or_create!(name: 'Foo', email: 'foo@bar.com', password: '123456789')
      @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
          time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: 1)
      visit event_path(@user.id)
    expect(page).to have_content('Birthday')
    end

    it 'shows a list of invitations' do
      @creator = User.first_or_create!(name: 'Fee', email: 'fee@bar.com', password: '123456789')
      @invitee = User.create(name: 'Foo', email: 'foo@bar.com', password: '123456789')
      @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
          time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: @creator.id)
      @invitation = Invitation.create(invitee_id: @invitee.id, event_id: @birthday.id) 
      visit user_path(@invitee.id)
      expect(page).to have_content('Birthday')
    end
    
  end    
end


# list_invitations 