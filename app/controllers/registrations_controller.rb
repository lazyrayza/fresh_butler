class RegistrationsController < Devise::RegistrationsController

  def create
    super
    if params[:user][:butler] == "true"
      @user.butler = true
    else
      @user.butler = false
    end
    @user.save
  end

  private

  def after_update_path_for(*)
    flash[:notice] = "Account succesfully updated"
    profile_path
  end

end
