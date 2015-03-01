require 'test_helper'

class UpdateBookTest < ActionDispatch::IntegrationTest
  test "edit book" do
    user = create(:user)
    book = create(:book, user: user)

    login_as(user)

    click_on t('actions.edit')
    fill_in label('book.title'), with: 'Update Task test'
    click_on button('book.update')

    assert_equal books_path, current_path
    assert page.has_text?(notice('book.update'))
    assert page.has_text?('Update Task test')
  end
end
