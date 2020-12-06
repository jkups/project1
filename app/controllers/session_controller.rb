class SessionController < ApplicationController
  def new
    redirect_to edit_profile_path(@current_user.id) if @current_user.present?
  end

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to edit_profile_path(user.id)

    else
      flash[:error] = 'Invalid email or Password'
      redirect_to login_path

    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
