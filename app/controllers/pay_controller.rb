class PayController < ApplicationController
  before_action :check_if_user_logged_in

  # def pay_with_braintree ref, total, nonce
  #   gateway = Braintree::Gateway.new(
  #     :environment => :sandbox,
  #     :merchant_id => ENV["BRAINTREE_MERCHANT_ID"],
  #     :public_key => ENV["BRAINTREE_PUBLIC_KEY"],
  #     :private_key => ENV["BRAINTREE_PRIVATE_KEY"],
  #   )
  #
  #   result = gateway.transaction.sale(
  #     :amount => total.to_s,
  #     :payment_method_nonce => nonce,
  #     :options => {
  #       :submit_for_settlement => true
  #     }
  #   )
  #
  #   result
  # end

  def validate_trxn share, property_id
    property = Property.find property_id
    return property.available_shares >= share ? true : false
  end

  def update_investment id, trxn_code, paymethod
    investment = Investment.find id
    investment.update trxn_code: trxn_code, pay_method: paymethod, trxn_status: 'successful'

    property = Property.find investment.property_id
    property.available_shares -= investment.invest_share
    property.save
  end

  def new
    @investment = Investment.find params[:id]
  end

  def create
    investment = Investment.find params[:id]

    if investment.trxn_valid?
      process_trxn = investment.pay_with_braintree params[:nonce]

      if process_trxn.success?
        puts process_trxn.transaction.id
        update_investment investment.id, process_trxn.transaction.id, params[:paymethod]

        redirect_to investments_path and return
      else
        puts "TRANSACTION FAILED"
        redirect_to root_path
      end
    else
      flash[:error] = "The number of units you want is not available."
      redirect_to properties_path
    end
  end
end
