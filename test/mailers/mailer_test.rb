require 'test_helper'

class MailerTest < ActionMailer::TestCase
  test "wellcome" do
    mail = Mailer.welcome('johndoe@exemple.org', 'John Doe')
    assert_equal t('mailer.welcome.subject'), mail.subject
    assert_equal ["johndoe@exemple.org"], mail.to
    assert_equal [MAILER_FROM], mail.from
    assert_match "John Doe", mail.body.encoded
    assert_match login_url, mail.body.encoded
  end
  test "forget password" do
    mail = Mailer.forgot_password('johndoe@exemple.org', 'token')
    assert_equal t('mailer.forgot_password.subject'), mail.subject
    assert_equal ["johndoe@exemple.org"], mail.to
    assert_equal [MAILER_FROM], mail.from
    #assert_match reset_password_url(token: 'token'), mail.body.encoded
  end
end
