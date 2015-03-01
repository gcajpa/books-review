require 'test_helper'

class RemoveBookTest < ActionDispatch::IntegrationTest
  test "remove book" do
    user = create(:user)
    book = create(:book, user: user)
    login_as(user)

    click_on t('actions.remove')
    assert page.has_text?(book.title)

    click_on t('books.confirm_removal')

    assert_equal books_path, current_path
    assert page.has_text?(notice('book.delete'))
    refute page.has_text?(book.title)
  end
  test "cancel remove book" do
    user = create(:user)
    book = create(:book, user: user)
    login_as(user)

    click_on t('actions.remove')
    click_on t('actions.cancel')

    assert_equal books_path, current_path
    refute page.has_text?(notice('book.delete'))
    assert page.has_text?(book.title)
  end
end
