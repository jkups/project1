class PropertiesController < ApplicationController
  def index
    @properties = Property.all
  end

  def show
    @property = Property.find params[:id]
  end

  def create
  end

  def edit
  end

  def destroy
  end

  def update
  end

  def new
  end
end
