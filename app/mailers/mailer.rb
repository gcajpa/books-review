class Mailer < ApplicationMailer

  def welcome(email, name)
    @name = name
    @email = email

    mail to: @email
  end
  def forgot_password(email, token)
    @token = token
    mail to: email
  end
end
