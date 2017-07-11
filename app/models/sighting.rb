class Sighting < ApplicationRecord
  belongs_to :animal
  validates :animal, :date, :time, :latitude, :longitude, presence:true
  
end
