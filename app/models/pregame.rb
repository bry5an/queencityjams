class Pregame < ActiveRecord::Base
  
  belongs_to  :event
  has_many   :users
  has_many   :prejam_spots
  
end
