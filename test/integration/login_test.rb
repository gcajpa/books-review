require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'valid crendentials' do
    user = create(:user)

    login_as(user)

    assert_equal books_path, current_path
    assert page.has_text?(t('user.greeting', name: user.name))
  end
  test 'invalid credentials' do
    user = create(:user)

    visit login_path
    click_button button('login')

    assert_equal login_path, current_path
    assert page.has_text?(alert('login.create'))
  end
end
