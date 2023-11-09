class Property < ApplicationRecord
  has_many :events, class_name: "Events::Property::BaseEvent"

end
