module Authentication
  extend ActiveSupport::Concern

  included do
    helper_method :logged_in?, :current_user, :redirect_user
  end

  private

  def redirect_user
    redirect_to books_path if logged_in?
  end

  def require_user_logged
    redirect_to login_path, alert: t('flash.must_be_logged_in') unless logged_in?
  end

  def logged_in?
    current_user.present?
  end

  def current_user
    User.find_by_id(session[:user_id]) if session[:user_id]
  end


end
