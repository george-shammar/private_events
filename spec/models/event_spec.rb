require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'finds all upcoming events' do
    @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2022-04-02',
      time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: 1)
    upcoming = Event.find_upcoming_events
    expect(upcoming.last[0]).to eq('Birthday')
    end

    it 'finds all past events' do
      @birthday = Event.create(title: 'Birthday', location: 'Foo City', date: '2020-04-02',
        time: '2000-01-01 14:22:00.000000000 +0000', description: 'Birthday', creator_id: 1)
      past = Event.find_past_events
      expect(past.last[0]).to eq('Birthday')
      end
end