class AdminAccountsController < ApplicationController
  before_action :check_if_admin_logged_in
  
  def index
    @accounts = Account.all
    @accounts.each do |acc|
      acc.invest_amount = acc.investment.where(trxn_status: 'successful').pluck(:invest_amount).sum
      acc.trxn_fee = acc.investment.where(trxn_status: 'successful').pluck(:trxn_fee).sum
      acc.properties = acc.investment.where(trxn_status: 'successful').pluck(:property_id).uniq.count
    end
  end

end
