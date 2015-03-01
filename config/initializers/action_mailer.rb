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
