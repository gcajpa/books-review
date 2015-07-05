source 'https://rubygems.org'
ruby '2.2.0'

gem 'rails', '4.2.0'
gem 'pg'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'bcrypt', '~> 3.1.7'

gem 'rails-i18n'
gem 'rails-env'
gem 'sucker_punch'
gem 'premailer-rails'

gem "wysiwyg-rails"

group :development do
  gem "letter_opener"
end

group :development, :test do
  gem 'byebug'
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'pry-meta', '~> 0.0.10'
  gem 'dotenv-rails'
end

group :test do
  gem 'capybara'
  gem 'factory_girl'
  gem 'simplecov', :require => false
end

group :production do
  gem "puma"
  gem "rails_12factor"
  gem "rack-timeout"
end
