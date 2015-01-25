class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :configure_permitted_parameters, if: :devise_controller?
  protect_from_forgery with: :exception

  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  
  decent_configuration do
    strategy DecentExposure::StrongParametersStrategy
  end
  
  private
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:provider, :uid, :email, :password,  :password_confirmation, :remember_me) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:provider, :uid, :email, :password, :oauth_expires_at,:remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:provider, :uid,  :password, :password_confirmation, :current_password) }
  end
end
