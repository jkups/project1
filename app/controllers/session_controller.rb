class SessionController < ApplicationController

  def new
    if @current_user.present?
      if @current_user.user_type == 'user'
        redirect_to edit_user_path(@current_user.id)
      else
        redirect_to admin_properties_path(@current_user.id)
      end
    end
  end

  def create
    user = User.find_by email: params[:email]

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to edit_user_path(user.id)

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
