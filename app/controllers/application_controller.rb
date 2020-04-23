class ApplicationController < ActionController::Base
  before_action :set_current_user

  def set_current_user
    session[:user_id] = 1
    @current_user = User.find_by(id: session[:user_id])
  end


end
