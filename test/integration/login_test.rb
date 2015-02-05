require 'test_helper'

class LoginTest < ActionDispatch::IntegrationTest
  test 'credenciais válidas' do
    user = create(:user)

    visit root_path
    click_link t('menu.signin')

    fill_in label('user.email'), with: user.email
    fill_in label('user.password'), with: '123456'
    click_button button('login')

    assert_equal books_path, current_path
    assert page.has_text?('Bem vindo!')
  end
end
