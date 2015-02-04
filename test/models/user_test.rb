require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "name is required" do
    user = User.create(name: nil)
    assert user.errors[:name].any?
  end
  test "email is required" do
    user = User.create(email: nil)
    assert user.errors[:email].any?
  end
  test "email is invalid" do
    %w[
      john@teste
      johndoe
      @teste
      123@test
      123@test.
    ].each do |email|
      user = User.create(email: email)
      assert user.errors[:email].any?, "#{email} must be invalid"
    end
  end
  test "email is valid" do
    %w[
      john@teste.com.br
      johndoe@dominio.com.br
      john.doe@dominio.com.br
      john_doe@dominio.com.br
      JOHN@dominio.com.br
    ].each do |email|
      user = User.create(email: email)
      assert user.errors[:email].empty?, "#{email} must be accepted"
    end
  end
  test "email must be unique" do
    user = User.create!(
      name: "John",
      email: "john@teste.com.br",
      password: "123456",
      password_confirmation: "123456"
    )
    another_user = user.dup
    another_user.save
    assert another_user.errors[:email].any?
  end
end
