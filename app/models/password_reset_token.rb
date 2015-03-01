class PasswordResetToken
  def self.generate(email)
    payload = {
      name: 'password_reset',
      expires: 1.hour.from_now.to_i,
      email: email
     }.to_json

    token = encryptor.encrypt_and_sign(payload)
    Base64.encode64(token).chomp
  end

  def self.valid?(token)
    payload = decryptor(token)
    return false unless payload
    payload['name'] == 'password_reset' && payload['expires'] > Time.current
  end

  def self.decryptor(token)
    token = Base64.decode64(token)
    payload = JSON.load(encryptor.decrypt_and_verify(token))
    payload['expires'] = Time.at(payload['expires'])
    payload
    rescue ActiveSupport::MessageVerifier::InvalidSignature
      false
  end

  def self.encryptor
    encryptor = ActiveSupport::MessageEncryptor.new(Rails.application.secrets.password_reset_token)
  end
end
