class Animal < ApplicationRecord
  has_many :sightings, dependent: :destroy
  validates :common_name, :latin_name, :kingdom, presence:true
end
