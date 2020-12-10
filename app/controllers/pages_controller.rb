class PagesController < ApplicationController
  def home
    redirect_to properties_path
  end
end
