class CheckoutController < ApplicationController
  before_action :check_if_logged_in

  def new
    @property = Property.find params[:id]
    @account = Account.find_by account_active: true, user_id: @current_user.id
  end

  def create
  end
end
