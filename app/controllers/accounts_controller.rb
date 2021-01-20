class AccountsController < ApplicationController
  before_action :check_if_user_logged_in

  #ajax call to switch and set active account
  #only one investment account can be active per time
  def switch
    @current_user.accounts.each do |account|
      account.account_active = false
      account.save
    end

    account = Account.find params[:id]
    account.account_active = true
    account.save

    redirect_to edit_account_path(account.id)
  end

  def update
    @account = Account.find params[:id]
    @account.update account_params

    redirect_to edit_account_path(@account.id)
  end

  def create
    @account = Account.new account_params
    @account.account_number = (rand() * 100000000).round
    @account.account_active = true
    @account.user_id = @current_user.id

    @account.save

    if @account.persisted?
      default_address = Address.find_by user_id: @current_user.id
      account_address = default_address.dup
      account_address.account_id = @account.id
      account_address.user_id = nil
      account_address.save

      @current_user.accounts.each do |account|
        if account.id != @account.id 
          account.account_active = false
          account.save
        end
      end

      redirect_to edit_account_path(@account.id)
    else
      redirect_to new_account_path
    end
  end

  def new
    @account = Account.new user_id: @current_user.id
  end

  def destroy
    account = Account.find params[:id]
    account.destroy

    if Account.all.any?
      account = Account.first
      account.account_active = true
      account.save

      redirect_to edit_account_path(account.id)
    else
      redirect_to new_account_path
    end
  end

  def edit
    @account = Account.find_by user_id: @current_user.id, account_active: true
  end

  private

  def account_params
    params.require(:account).permit(
      :account_name, :account_type, :company_name, :reg_number,
      address_attributes: [ :id, :street_number, :street_name, :suburb, :zipcode, :state, :country]
    )
  end

end
