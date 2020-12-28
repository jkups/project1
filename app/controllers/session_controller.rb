class SessionController < ApplicationController

  def redirect_user user
    if user.user_type == 'user'
      redirect_to edit_user_path(user.id)
    else
      redirect_to admin_properties_path
    end
  end

  def new
    redirect_user @current_user if @current_user.present?
  end

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_user user
    else
      flash[:error] = 'Invalid Email or Password.'
      redirect_to login_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to login_path
  end
end
