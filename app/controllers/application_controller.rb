class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  protected

  def check_authorization
    render nothing: true, status: :unauthorized if session[:me].nil?
  end
end
