namespace :queencityjams2 do 
  task import_event_artists: :environment do 
    events = HTTParty.get("http://api.songkick.com/api/3.0/metro_areas/13579/calendar.json?apikey=#{ENV['songkick_api_key']}")
    pages = ((events["resultsPage"]["totalEntries"].to_i) / 50) + 1

    1.upto(pages).each do |page_number|
      puts "#{((page_number / pages.to_f) * 100).to_i}% Complete"
      events_by_page = HTTParty.get("http://api.songkick.com/api/3.0/metro_areas/13579/calendar.json?apikey=#{ENV['songkick_api_key']}&page=#{page_number}")
      all_events = events_by_page["resultsPage"]["results"]["event"]
      0.upto(49).each do |i|
        all_events[i]["performance"].each do |artist|
          artist_index = all_events[i]["performance"].index(artist)
          @event_artist = EventArtist.find_or_initialize_by(songkick_event_id: all_events[i]["id"], artist_id: all_events[i]["performance"][artist_index]["artist"]["id"])
          @event_artist.songkick_event_id = all_events[i]["id"]
          @event_artist.artist_uri = all_events[i]["performance"][artist_index]["artist"]["uri"]
          @event_artist.artist_name = all_events[i]["performance"][artist_index]["artist"]["displayName"]
          @event_artist.artist_id = all_events[i]["performance"][artist_index]["artist"]["id"]
          @event_artist.performance_name = all_events[i]["performance"][artist_index]["displayName"]
          @event_artist.billing_index = all_events[i]["performance"][artist_index]["billingIndex"]
          @event_artist.performance_id = all_events[i]["performance"][artist_index]["id"]
          @event_artist.billing = all_events[i]["performance"][artist_index]["billing"]
          @event_artist.save!
        end
      end
    end
    
  end
end