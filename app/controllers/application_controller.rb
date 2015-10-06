class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    stored_location_for(resource) ||
    if resource.is_a?(AdminUser)
      admin_dashboard_path
    else
      root_path
    end
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) << :name << :access
    devise_parameter_sanitizer.for(:account_update) << :name << :access
  end
end
