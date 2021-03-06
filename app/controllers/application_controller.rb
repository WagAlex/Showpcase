class ApplicationController < ActionController::Base
  include Pundit
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    %w(first_name last_name).each do |field|
      devise_parameter_sanitizer.for(:sign_up) << field.to_sym
    end
  end


end
