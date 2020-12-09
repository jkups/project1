class CheckoutController < ApplicationController
  before_action :check_if_logged_in

  def calculate_price shares, property
    share_price = property.value / property.total_shares
    investment = shares.to_f * share_price
    trxn_fees = 0.1 * investment
    total_due = investment + trxn_fees

    {investment: investment, trxn_fees: trxn_fees, total_due: total_due}
  end

  def price
    property = Property.find params[:id]
    result = calculate_price params[:input_shares], property

    render json: {
      investment: result[:investment],
      trxn_fees: result[:trxn_fees],
      total_due: result[:total_due]
    }
  end

  def new
    @property = Property.find params[:id]
    @account = Account.find_by account_active: true, user_id: @current_user.id
  end

  def create
    property = Property.find params[:id]

    if params[:input_shares].to_i > property.available_shares
      flash[:error] = 'There is not enough share units to acquire.'
      redirect_to new_checkout_path(property.id) and return
    end

    result = calculate_price params[:buy_shares], property

    investment = Investment.create(
      invest_amount: result[:investment],
      invest_share: params[:input_shares],
      trxn_fee: result[:trxn_fees],
      total_due: result[:total_due],
      trxn_ref: (rand() * 100000000).round,
      property_id: params[:id],
      account_id: params[:account_id]
    )

    redirect_to new_pay_path(investment.id)
  end
end
