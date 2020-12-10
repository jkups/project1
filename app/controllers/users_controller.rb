class UsersController < ApplicationController
  before_action :check_if_user_logged_in, :except => [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      Address.create user_id: @user.id

      session[:user_id] = @user.id
      redirect_to edit_user_path(@user.id)
    else
      render :new and return
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    user = User.find params[:id]
    if user.id != @current_user.id
      redirect_to login_path
      return
    end

    user.update user_params
    redirect_to edit_user_path(user.id)
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :middle_name, :last_name, :email, :password, :mobile_number, :dial_code, :document_id, :document_type, :expiry_date, :issue_country,
      address_attributes: [ :id, :street_number, :street_name, :suburb, :zipcode, :state, :country]
    )
  end

end
