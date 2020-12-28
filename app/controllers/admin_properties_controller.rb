class AdminPropertiesController < ApplicationController
  before_action :check_if_admin_logged_in

  def index
    @properties = Property.all
  end

  def new
    @property = Property.new
  end

  def edit
    @property = Property.find params[:id]
  end

  def create
    property = Property.new property_params
    property.prop_id = 'PID' + (rand() * 1000).round.to_s
    property.available_shares = params[:property][:total_shares]

    property.upload_images params[:property][:prop_images] if params[:property][:prop_images].present?

    property.save
    redirect_to admin_properties_path
  end

  def update
    property = Property.find params[:id]
    property.update property_params

    if params[:property][:prop_images].present?
      property.destroy_images if property.prop_images.any?
      property.upload_images params[:property][:prop_images]
    end

    property.save
    redirect_to admin_properties_path
  end

  def destroy
    property = Property.find params[:id]

    property.destroy_images if property.prop_images.any?
    property.destroy
    redirect_to admin_properties_path
  end

  private

  def property_params
    params.require(:property).permit(
      :prop_type, :name, :status, :address, :region, :description, :bed, :bath, :car_park, :plot_size, :currency, :value, :min_shares, :total_shares
    )
  end
end
