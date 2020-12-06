class AccountsController < ApplicationController
  def index
  end

  def switch
    @current_user.profile.accounts.each do |account|
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
    @account.update update_account_params
    redirect_to edit_account_path(@account.id)
  end

  def create
    @account = Account.create(
      account_number: (rand() * 100000000).round,
      account_name: params[:account][:account_name],
      account_type: params[:account][:account_type],
      company_name: params[:account][:company_name],
      reg_number: params[:account][:reg_number],
      account_active: true,
      profile_id: @current_user.profile.id
    )

    if @account.persisted?
      Account.all.each do |account|
        if account.id != @account.id
          account.account_active = false
          account.save
        end
      end

      LegalAddress.create(
        street_number: params[:account][:street_number],
        street_name: params[:account][:street_name],
        suburb: params[:account][:suburb],
        zipcode: params[:account][:zipcode],
        state: params[:account][:state],
        country: params[:account][:country],
        account_id: @account.id
      )

      redirect_to edit_account_path(@account.id)
    else
      redirect_to new_account_path
    end
  end

  def new
    redirect_to root_path and return unless @current_user.present?
    @account = Account.new profile_id: @current_user.profile.id
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

  def update_account_params
    params.require(:account).permit(
      :account_name,
      legal_address_attributes: [ :id, :street_number, :street_name, :suburb, :zipcode, :state, :country]
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
