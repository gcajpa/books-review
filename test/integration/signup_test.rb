require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "signup" do
    visit root_path
    click_on t('menu.signup')

    fill_in label('user.name'), with: 'John Doe'
    fill_in label('user.email'), with: 'johndoe@exemple.com.br'
    fill_in label('user.password'), with: 'sekret'
    fill_in label('user.password_confirmation'), with: 'sekret'

    click_on button('user.create')

    assert_equal login_path, current_path
    assert page.has_text?('Cadastro realizado com sucesso!')
  end
  test "when providing invalid data" do
    visit root_path

    click_on t('menu.signup')
    click_on button('user.create')

    assert_equal signup_path, current_path
    assert page.has_text?(form_error_message)

  end
end
