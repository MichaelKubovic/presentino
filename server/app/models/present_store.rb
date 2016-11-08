class PresentStore < ApplicationRecord
  validates :price, presence: true, numericality: true
  validates :url, presence: true

  belongs_to :present
end
