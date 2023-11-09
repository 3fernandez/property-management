class Api::V1::PropertiesController < ApplicationController
  def index
    properties = Property.active

    render json: properties
  end

  def create
    property = Events::Property::Created.create(payload: property_params)

    render json: property, status: :created
  end
end
