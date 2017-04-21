require "application_responder"

class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder

  protect_from_forgery with: :exception

  respond_to :json, :html

  def angular
    render 'layouts/application'
  end

end
