class Events::Property::Destroyed < Events::Property::BaseEvent
  payload_attributes :id

  def apply(property)
    property.deleted = true

    property
  end
end
