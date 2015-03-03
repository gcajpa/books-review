class PasswordResetController < ApplicationController
  before_filter :valid_token
  before_filter :set_payload
  before_filter :set_user
  def edit
  end

  def update
    @user = @user.update(user_params)
    redirect_to login_path, notice: t('flash.password_reset.update.notice')
  end

  private

  def valid_token
    redirect_to login_path, alert: t('flash.password_reset.update.alert') unless PasswordResetToken.valid?(params[:token])
  end
  def set_payload
    @payload = PasswordResetToken.decryptor(params[:token])
  end
  def set_user
    @user = User.find_by_email(@payload['email'])
  end

  def user_params
    params
      .require(:user)
      .permit(:password, :passowrd_confirmation)
  end
end
