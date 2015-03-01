Rails.env.on(:production)do |config|
  Rake::Timeout.timeout = Integer( ENV['TIMEOUT_REQUEST'] || 10 )
end
