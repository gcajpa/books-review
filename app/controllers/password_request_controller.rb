class PasswordRequestController < ApplicationController
  def new
  end
  def create
    user = User.find_by_email(params[:email])
    if user
      token = PasswordResetToken.generate(user.email)
      Mailer.forgot_password(user.email, token).deliver_later
      redirect_to login_path, notice: t('flash.password_request.create.notice')
    else
      #flash.now[:alert] = t('flash.password_request.create.alert')
      flash.now.alert = t('flash.password_request.create.alert')
      render 'new'
    end
  end
end
