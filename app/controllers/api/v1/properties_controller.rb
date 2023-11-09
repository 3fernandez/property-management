class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update]

  def index
    properties = Property.active

    render json: properties
  end

  def create
    property = Events::Property::Created.create(payload: property_params)

    render json: property, status: :created
  end

  def show
    render json: @property
  end
end
