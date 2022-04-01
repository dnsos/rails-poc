class FocusGroup < ApplicationRecord
  extend FriendlyId
  friendly_id :label, use: :slugged

  has_many :help_offers, dependent: :destroy
  has_many :facilities, through: :help_offers
end
