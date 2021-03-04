require 'rails_helper'

RSpec.describe EventsController, type: :routing do
  describe "routing" do
    it "routes to #new" do
      expect(get: "events/new").to route_to("events#new")
    end  
  end
end