class Events::Property::Created < Events::Property::BaseEvent
  payload_attributes :name, :location, :price, :status

  def apply(property)
    property.name = name
    property.location = location
    property.price = price
    property.status = status

    property
  end
end
