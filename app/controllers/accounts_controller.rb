class AccountsController < ApplicationController
  def index
  end

  def update
  end

  def create
    @account = Account.create(
      account_number: (rand() * 1000000).round,
      account_name: params[:account][:account_name],
      account_type: params[:account][:account_type],
      company_name: params[:account][:company_name],
      reg_number: params[:account][:reg_number],
      profile_id: @current_user.profile.id
    )

    if @account.persisted?
      LegalAddress.create(
        street_number: params[:account][:street_number],
        street_name: params[:account][:street_name],
        suburb: params[:account][:suburb],
        zipcode: params[:account][:zipcode],
        state: params[:account][:state],
        country: params[:account][:country],
        account_id: @account.id
      )
      if Account.all.count == 1
        @account.account_active = true
        @account.save
      end

      redirect_to edit_account_path(@account.id)
    else
      render :new and return
    end
  end

  def new
    redirect_to root_path and return unless @current_user.present?
    @account = Account.new profile_id: @current_user.profile.id
  end

  def destroy
  end

  def show
  end

  def edit
  end
end
