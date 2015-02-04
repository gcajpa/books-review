class SignupController < ApplicationController
  def new
    @user = User.new
  end
  def create
    @user = User.new user_params
    if @user.save
      redirect_to login_path, notice: t('flash.signup.create.notice')
    else
      render :new
      #flash.now 'Verifique o formulário antes de enviar!'
    end
  end

  private
  def user_params
    params
    .require(:user)
    .permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end
end
