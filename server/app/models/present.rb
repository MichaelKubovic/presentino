class Present < ApplicationRecord
  validates :label, presence: true
  validates :price, presence: true, numericality: true

  has_and_belongs_to_many :holidays
  has_many :present_stores
end
