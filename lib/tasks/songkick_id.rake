namespace :queencityjams2 do 
  task songkick_id: :environment do 
    
    @event_artists = EventArtist.all
    
    @event_artists.each do |artist|
      artist.songkick_event_id = artist.event_id
      artist.save!
    end
    
  end
end