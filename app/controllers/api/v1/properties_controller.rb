class Api::V1::PropertiesController < ApplicationController
  before_action :set_property, only: [:show, :update]

  def index
    properties = Property.active

    render json: properties
  end

  def create
    property = Events::Property::Created.create(payload: property_params)

    if property.property_id.nil?
      render json: {}, status: :unprocessable_entity
    else
      render json: property, status: :created
    end
  end

  def show
    render json: @property
  end

  def update
    property = Events::Property::Updated.create(property_id: params[:id], payload: property_params)

    render json: property, status: :ok
  end

  def destroy
    Events::Property::Destroyed.create(property_id: property_params[:id], payload: property_params)

    render :no_content
  end

  private
    def set_property
      @property = Property.active.find(params[:id])
    end

    def property_params
      params.require(:properties).permit(:id, :name, :location, :price, :status)
    end
end
