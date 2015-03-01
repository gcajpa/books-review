MAILER_FROM = ENV.fetch('MAILER_FROM')

Rails.env.on(:development) do |config|
  config.action_mailer.delivery_method = :letter_opener
end
