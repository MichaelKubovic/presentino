class Holiday < ApplicationRecord
  validates :label, presence: true

  has_and_belongs_to_many :presents

  default_scope -> { order('created_at DESC') }
end
