require 'test_helper'

class PasswordResetTokenTest < ActiveSupport::TestCase
  test 'generate valid token' do
    encrypted_token = PasswordResetToken.generate('john@domain.com')
    assert PasswordResetToken.valid?(encrypted_token)
  end
  test 'generate invalid token' do
    encrypted_token = travel_to 2.hours.ago do
      PasswordResetToken.generate('john@domain.com')
    end
    refute PasswordResetToken.valid?(encrypted_token)
  end
  test 'invalid token' do
    refute PasswordResetToken.valid?('invalid')
  end
  test 'decrypt token' do
    encrypted_token = PasswordResetToken.generate('john@domain.com')
    payload = PasswordResetToken.decryptor(encrypted_token)
    assert_equal 'john@domain.com', payload['email']
  end
end
