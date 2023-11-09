class Events::Property::BaseEvent < Events::BaseEvent
  self.table_name = "property_events"

  belongs_to :property, class_name: "::Property"
end
