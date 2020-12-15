class AdminController < ApplicationController
  before_action :check_if_admin_logged_in

  def property_index
    @properties = Property.all
  end

  def property_new
    @property = Property.new
  end

  def property_edit
    @property = Property.find params[:id]
  end

  def property_create
    property = Property.new property_params
    property.prop_id = 'PID' + (rand() * 1000).round.to_s
    property.available_shares = params[:property][:total_shares]

    if params[:property][:prop_images].present?
      params[:property][:prop_images].each do |image|
        req = Cloudinary::Uploader.upload(image)
        property.prop_images << req["public_id"]
      end
    end
    property.save
    redirect_to admin_properties_path
  end

  def property_update
    property = Property.find params[:id]
    property.update property_params

    if params[:property][:prop_images].present?
      if property.prop_images.any?
        property.prop_images.each do |image|
          Cloudinary::Uploader.destroy(image, { invalidate: true })
        end
        property.prop_images = []
      end

      params[:property][:prop_images].each do |image|
        req = Cloudinary::Uploader.upload(image)
        property.prop_images << req["public_id"]
      end
    end
    property.save
    redirect_to admin_properties_path
  end

  def property_destroy
    property = Property.find params[:id]

    if property.prop_images.any?
      property.prop_images.each do |image|
        Cloudinary::Uploader.destroy(image, { invalidate: true })
      end
    end

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
