class Property < ApplicationRecord
  has_many :events, class_name: "Events::Property::BaseEvent"

  enum status: { available: 0, sold: 1 }

  scope :active, -> { where(deleted: false) }
end
