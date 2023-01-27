class ApplicationController < ActionController::Base
  add_flash_types :info, :error, :warning, :success

  def login?
    session[:user_id].nil?
  end

  def get_current_user
    @current_user = session[:user_id]
  end

  def authenticate
    redirect_to login_path, error: "Log in to access this page" if login?
  end
end
