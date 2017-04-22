require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception

  # allow devise controller WHITELIST params
  before_action :configure_permitted_parameters, if: :devise_controller?

  respond_to :json, :html

  def angular
    render 'layouts/application'
  end

  def configure_permitted_parameters
  #  devise_parameter_sanitizer.for(:sign_in)        << :username
  devise_parameter_sanitizer.permit(:sign_up, keys: [:username])
  #  devise_parameter_sanitizer.for(:account_update) << :username
  end

end
