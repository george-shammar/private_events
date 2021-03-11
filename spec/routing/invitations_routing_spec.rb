require 'rails_helper'

RSpec.describe InvitationsController, type: :routing do
  describe 'routing' do
    it 'routes to #new' do
      expect(get: '/events/1/invitations/new').to route_to('invitations#new', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/events/1/invitations/new').to route_to('invitations#create', id: '1')
    end
  end
end
