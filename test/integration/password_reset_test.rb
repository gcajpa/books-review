require 'test_helper'

class PasswordResetTest < ActionDispatch::IntegrationTest
  test 'reset password' do
    user = create(:user)
    visit root_path

    click_on t('menu.login')
    click_on t('forget_password')

    fill_in label('user.email'), with: user.email
    click_on t('forget_password')

    mail = ActionMailer::Base.deliveries.last
    token = CGI.unescape(mail.text_part.body.match(/token=([^\s]+)/)[1])

    visit reset_password_path(token: token)

    fill_in label('user.new_password'), with: 'new password'
    fill_in label('user.password_confirmation'), with: 'new password'
    click_on button('password_reset.create')

    assert page.has_text?(notice('password_reset.update'))

    login_as(user, 'new password')
    assert page.has_text?(t('user.greeting', name: user.name))
  end
  test 'invalid token' do
    visit reset_password_path(token: 'invalid')
    assert_equal login_path, current_path
    assert page.has_text?(alert('password_reset.update'))
  end
  test 'providing invalid email' do
    visit root_path

    click_on t('menu.login')
    click_link t('forget_password')

    fill_in label('user.email'), with: 'invalid mail'
    click_on t('forget_password')

    assert_equal request_password_new_path, current_path
    assert page.has_text?(alert('password_request.create'))
  end
end
