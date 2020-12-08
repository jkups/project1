class AccountsController < ApplicationController
  def index
  end

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
    redirect_to root_path and return unless @current_user.present?
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

      Account.all.each do |account|
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
    redirect_to login_path and return unless @current_user.present?
    @account = Account.new user_id: @current_user.id
  end

  def destroy
    redirect_to root_path and return unless @current_user.present?
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

  def show
  end

  def edit
    redirect_to root_path and return unless @current_user.present?
    @account = Account.find_by account_active: true
  end

  private

  def account_params
    params.require(:account).permit(
      :account_name, :account_type, :company_name, :reg_number,
      address_attributes: [ :id, :street_number, :street_name, :suburb, :zipcode, :state, :country]
    )
  end

  # def new_account_params
  #   params.require(:account).permit(
  #     :account_name, :account_type, :company_name, :reg_number, 'profile_id' => @current_user.profile.id
  #   )
  # end
  #
  # def legal_address_params
  #   params.require(:account).permit(
  #     :street_number, :street_name, :suburb, :zipcode, :state, :country
  #   )
  # end
end
