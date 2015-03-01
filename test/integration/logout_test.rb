require 'test_helper'

class LogoutTest < ActionDispatch::IntegrationTest
  test "session expired" do
    user = create(:user)
    login_as(user)
    click_on t('menu.signout')
    assert_equal login_path, current_path
  end
  test 'unlogged' do
    visit books_path
    assert_equal login_path, current_path
    assert page.has_text?(t('flash.must_be_logged_in'))
  end
end
