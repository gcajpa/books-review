ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'capybara/rails'
require_relative 'support/factories'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  include FactoryGirl::Syntax::Methods
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def t(*args)
    I18n.t(*args)
  end

  def label(scope)
    t(scope, scope: 'labels')
  end

  def button(scope)
    t(scope, scope: 'helpers.submit')
  end

  def form_error_message()
    t('form_error_message')
  end

  def flash(scope)
    t(scope, 'flash.signup')
  end

  teardown do
    Capybara.reset_sessions!
  end
end
