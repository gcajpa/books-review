require 'test_helper'

class UpdateBooksStatusTest < ActionDispatch::IntegrationTest
  test "check pending" do
    user = create(:user)
    completed_book = create(:book, :completed, user: user)
    pending_book = create(:book, user: user)

    login_as user

    check pending_book.title
    click_on button('update_all')

    assert_equal 2, all('input[type="checkbox"][checked]').count
    assert page.has_text?(notice('book.batch_update'))
  end
end
