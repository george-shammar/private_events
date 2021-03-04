module EventsHelper
   def event_title
    @events.each do |event|
        event.title
    end
   end 
end
