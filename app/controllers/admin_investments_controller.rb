class AdminInvestmentsController < ApplicationController
  before_action :check_if_admin_logged_in

  def index
    @investments = Investment.where trxn_status: 'successful'
    @investments.each do |inv|
      inv.property_name = inv.property.name
      inv.account_name = inv.account.account_name
    end
  end

end
