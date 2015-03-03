Rails.env.on(:production)do |config|
  Rack::Timeout.timeout = Integer( ENV['TIMEOUT_REQUEST'] || 10 )
end
