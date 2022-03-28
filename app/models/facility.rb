class Facility < ApplicationRecord
  validates :title, :latitude, :longitude, presence: true

  has_many :help_offers, dependent: :destroy
  has_many :focus_groups, through: :help_offers
end
