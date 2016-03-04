namespace :queencityjams2 do 
  task import_events: :environment do 
    events = HTTParty.get("http://api.songkick.com/api/3.0/metro_areas/13579/calendar.json?apikey=#{ENV['songkick_api_key']}")
    pages = ((events["resultsPage"]["totalEntries"].to_i) / 50) + 1

    1.upto(pages).each do |page_number|
      puts "#{(page_number / pages.to_f) * 100}% Complete"
      events_by_page = HTTParty.get("http://api.songkick.com/api/3.0/metro_areas/13579/calendar.json?apikey=#{ENV['songkick_api_key']}&page=#{page_number}")
      all_events = events_by_page["resultsPage"]["results"]["event"]
      0.upto(49).each do |i|
        @event = Event.find_or_initialize_by(songkick_event_id: all_events[i]['id'])
        @event.songkick_event_id = all_events[i]["id"]
        @event.event_type = all_events[i]["type"]
        @event.uri = all_events[i]["uri"]
        @event.event_name = all_events[i]["displayName"]
        @event.start_time = all_events[i]["start"]["time"]
        @event.start_date = all_events[i]["start"]["date"]
        @event.city = all_events[i]["location"]["city"]
        @event.latitude = all_events[i]["location"]["lat"]
        @event.longitude = all_events[i]["location"]["lng"]
        @event.venue_id = all_events[i]["venue"]["id"]
        @event.venue_name = all_events[i]["venue"]["displayName"]
        @event.venue_uri = all_events[i]["venue"]["uri"]
        @event.venue_latitude = all_events[i]["venue"]["lat"]
        @event.venue_longitude = all_events[i]["venue"]["lng"]
        @event.venue_metro_uri = all_events[i]["venue"]["metroArea"]["uri"]
        @event.venue_metro_name = all_events[i]["venue"]["metroArea"]["displayName"]
        @event.venue_metro_country_name = all_events[i]["venue"]["metroArea"]["country"]["displayName"]
        @event.venue_metro_id = all_events[i]["venue"]["metroArea"]["id"]
        @event.venue_metro_state_name = all_events[i]["venue"]["metroArea"]["state"]["displayName"]
        @event.popularity = all_events[i]["popularity"]
        @event.save!
      end
    end
    
  end
end
