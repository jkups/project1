class InvestmentsController < ApplicationController
  before_action :check_if_user_logged_in

  def calculate_price shares, property
    p shares
    share_price = property.value / property.total_shares
    investment = shares.to_f * share_price
    trxn_fees = 0.1 * investment
    total_due = investment + trxn_fees

    {investment: investment, trxn_fees: trxn_fees, total_due: total_due}
  end

  def update_price
    property = Property.find params[:id]
    result = calculate_price params[:input_shares], property

    render json: {
      investment: result[:investment],
      trxn_fees: result[:trxn_fees],
      total_due: result[:total_due]
    }
  end

  def index
    @account = Account.find_by user_id: @current_user.id, account_active: true
    @investments = Investment.where account_id: @account.id, trxn_status: "successful"
    @investments = @investments.each { |inv| inv.property_name = inv.property.name }
  end

  def show
  end

  def new
    @property = Property.find params[:id]
    @account = Account.find_by account_active: true, user_id: @current_user.id

    if @account.nil?
      flash[:error] = "You need to create an investment account."
      redirect_to new_account_path
    end
  end

  def create
    property = Property.find params[:id]
    puts "id: #{params[:id]}, property: #{property.id}"
    if params[:input_shares].to_i > property.available_shares
      flash[:error] = 'There is not enough share units to acquire.'
      redirect_to new_investment_path(property.id) and return
    end

    result = calculate_price params[:input_shares], property
    p "result: #{result}"
    investment = Investment.create(
      invest_amount: result[:investment],
      invest_share: params[:input_shares],
      trxn_fee: result[:trxn_fees],
      total_due: result[:total_due],
      trxn_ref: (rand() * 100000000).round.to_s,
      property_id: params[:id],
      account_id: params[:account_id]
    )

    redirect_to new_pay_path(investment.id)
  end
end
