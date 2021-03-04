require 'rails_helper'

include UsersHelper
RSpec.describe UsersHelper, type: :helper do
  it 'retrieves the events created by a user' do
    @user = User.create(name: 'Foo', email: 'foo@bar.com', password: '123456789')
    @event = @user.events.build(title: 'Birthday', location: 'Foo City', date: '2021-04-02', time: "2000-01-01 14:22:00.000000000 +0000")
    expect(find_events_by_user(@user).last[:title]).to equal('Birthday')
    end
end