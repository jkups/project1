class AdminController < ApplicationController
  before_action :check_if_admin_logged_in

  def index
    p "i am in admin"
  end

  def property_index
    @properties = Property.all
  end

  def property_new
    @property = Property.new
  end

  def property_edit

  end

  def property_create

  end

  def property_update

  end

  def property_destroy

  end
end
