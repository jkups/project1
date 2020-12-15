class PayController < ApplicationController
  before_action :check_if_user_logged_in

  def new
    @investment = Investment.find params[:id]
  end

  def create
    investment = Investment.find params[:id]

    if investment.trxn_valid?
      process_trxn = investment.pay_with_braintree params[:nonce]

      if process_trxn.success?
        trxn_code = process_trxn.transaction.id

        investment.update_trxn trxn_code, params[:paymethod]
        redirect_to investments_path and return
      else
        flash[:error] = "Your transaction didn't go through. Please try again."
        redirect_to properties_path
      end
    else
      flash[:error] = "The number of units you want is not available."
      redirect_to properties_path
    end
  end
end
