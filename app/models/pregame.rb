class Pregame < ActiveRecord::Base
  
  belongs_to  :event
  
  has_many :pregame_to_users
  has_many :users, :through => :pregame_to_users

    
  
end
