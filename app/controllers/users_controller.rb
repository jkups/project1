class UsersController < ApplicationController
  # def index
  # end

  def new
    redirect_to edit_profile_path(@current_user.id) if @current_user.present?
    @user = User.new
  end

  def create
    @user = User.create user_params

    if @user.persisted?
      profile = Profile.create user_id: @user.id, first_name: @user.first_name, last_name: @user.last_name, email: @user.email

      Address.create profile_id: profile.id
      Identity.create profile_id: profile.id

      session[:user_id] = @user.id
      redirect_to edit_profile_path(profile.id)
    else
      render :new and return
    end
  end

  # def show
  #   redirect_to root_path unless @current_user.present?
  #
  # end

  # def edit
  #   redirect_to root_path unless @current_user.present?
  #
  # end

  def update
    
  end

  def destroy
  end

  private

  def user_params
    params.require(:user).permit(
      :first_name, :last_name, :email, :password,
    )
  end

end
