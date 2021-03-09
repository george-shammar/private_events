require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the EventsHelper. For example:
#
# describe EventsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
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
end
