require 'test_helper'

class SignupTest < ActionDispatch::IntegrationTest
  test "signup" do
    visit root_path
    click_on 'Cadastre-se'

    fill_in 'Seu nome', with: 'John Doe'
    fill_in 'Seu email', with: 'johndoe@dominio.com.br'
    fill_in 'Sua senha', with: 'sekret'
    fill_in 'Confirme sua senha', with: 'sekret'

    click_on 'Quero me cadastrar'

    assert_equal login_path, current_path
    assert page.has_text?('Cadastro realizado com sucesso!')
  end
  test "when providing invalid data" do
    visit root_path

    click_on 'Cadastre-se'
    click_on 'Quero me cadastrar'

    assert_equal signup_path, current_path
    assert page.has_text?('Verifique o formulário antes de enviar!')

  end
end
