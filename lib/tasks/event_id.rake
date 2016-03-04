namespace :queencityjams2 do 
  task event_id: :environment do 
    
    @artists = EventArtist.all
    
    @artists.each do |artist|
      artist.link_id
    end
    
  end
end
