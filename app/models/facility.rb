class Facility < ApplicationRecord
  validates :title, :latitude, :longitude, presence: true
end
