class PropertiesController < ApplicationController

  def index
    @properties = Property.where status:'active'
  end

  def show
    @property = Property.find params[:id]
  end

end
