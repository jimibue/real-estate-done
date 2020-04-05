class Api::PropertiesController < ApplicationController
  # def index
  #   render json: Property.available
  # end

  # def index
  #   render json: Property.page(@page).available
  # end

  def index
    properties = Property.page(@page).available
    total_pages = properties.total_pages
    render json: { properties: properties, total_pages: total_pages }
  end

  private

  def set_page
    @page = params[:page] || 1
  end
end
