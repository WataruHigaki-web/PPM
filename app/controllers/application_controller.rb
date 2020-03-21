class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      [:name,:name_kana,:zip_code,:address,:phone_number])
  end
  
  def after_sign_out_path_for(resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_root_path(current_admin)
    when User
      users_root_path(current_user)
    else
    end
  end


end
