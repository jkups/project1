class ProfilesController < ApplicationController
  def index
  end

  def new
  end

  def create
  end

  def show
  end

  def edit
    redirect_to root_path and return unless @current_user.present?
    @profile = Profile.find_by user_id: @current_user.id
  end

  def update
    profile = Profile.find params[:id]
    if profile.user_id != @current_user.id
      redirect_to login_path
      return
    end

    profile.update profile_params
    redirect_to edit_profile_path(profile.id)
  end

  def destroy
  end

  private

  def profile_params
    params.require(:profile).permit(
      :middle_name, :mobile_number,
      identity_attributes: [ :id, :document_type, :document_id, :expiry_date, :issue_country],
      address_attributes: [ :id, :street_number, :street_name, :suburb, :zipcode, :state, :country]
    )
  end

end
