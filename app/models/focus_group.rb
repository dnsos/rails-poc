class FocusGroup < ApplicationRecord
  has_many :help_offers, dependent: :destroy
  has_many :facilities, through: :help_offers
end
