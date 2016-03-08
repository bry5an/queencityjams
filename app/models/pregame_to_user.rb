class PregameToUser < ActiveRecord::Base
  
  belongs_to :pregame, dependent: :destroy
  belongs_to :user, dependent: :destroy
  
end
