class ApplicationController < ActionController::Base
  helper_method :logged_in?

  def logged_in?
    session[:current_mg_id]
  end

  def set_current_user
    mg_id = session[:current_mg_id]
    @current_moviegoer = Moviegoer.find mg_id if logged_in?
  end

end
