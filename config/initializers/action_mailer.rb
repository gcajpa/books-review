Rails.env.on(:development) do |config|
  config.action_mailer.default_url_options = {
    host: 'localhost',
    port: 3000
  }
end
Rails.env.on(:test, :production) do |config|
  config.action_mailer.default_url_options = {
    host: 'http://www.booklist.com'
  }
end
Rails.env.on(:test, :production) do |config|
  config.action_mailer.delivery_method = :smtp
  ActionMailer::Base.smtp_settings = {
    address: 'smtp.sendgrid.net',
    port: '587',
    authentication: :plain,
    user_name: ENV['SENDGRID_USERNAME'],
    password: ENV['SENDGRID_PASSWORD'],
    domain: ENV['DOMAIN'],
    enable_starttls_auto: true
  }
end
