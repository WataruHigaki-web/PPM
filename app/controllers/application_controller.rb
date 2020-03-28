# frozen_string_literal: true

class ApplicationController < ActionController::Base
  # before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

Refile.secret_key = '833b7dcf4d3e65223a6f92d638750bbb2e5a0af5db327be07c0615af34ddb5126236ad586fa9d8a38d968c8b925d27bb449c82c9fa5824dc1531fac9250abb63'
  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys:
      %i[name name_kana zip_code address phone_number])
  end

  def after_sign_out_path_for(_resource)
    root_path
  end

  def after_sign_in_path_for(resource)
    case resource
    when Admin
      admins_root_path(current_admin)
    when User
      users_root_path(current_user)
    end
  end
end
