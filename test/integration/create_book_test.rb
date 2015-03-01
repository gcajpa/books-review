require 'test_helper'

class CreateBookTest < ActionDispatch::IntegrationTest
  test 'valid date' do
    user = create(:user)
    login_as(user)

    fill_in label('book.title'), with: 'Some Text'
    click_on button('book.create')

    assert books_path, current_path
    assert page.has_text?(notice('book.create'))
    assert page.has_text?('Some Text')
  end
  test 'no valide data' do
    user = create(:user)
    login_as(user)

    click_on button('book.create')

    assert_equal books_path, current_path
    assert page.has_text?(alert('book.create'))
  end
end
