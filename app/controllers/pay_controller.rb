class PayController < ApplicationController
  before_action :check_if_logged_in
  
  def new
    @investment = Investment.find params[:id]
  end

  def create
  end
end
