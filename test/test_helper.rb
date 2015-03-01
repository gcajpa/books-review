require 'simplecov'
SimpleCov.start 'rails'

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

  def t(*args)
    I18n.t(*args)
  end
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL

  def label(scope)
    t(scope, scope: 'labels')
  end

  def button(scope)
    t(scope, scope: 'helpers.submit')
  end

  def form_error_message()
    t('form_error_message')
  end

  def notice(scope)
    t("flash.#{scope}.notice")
  end

  def alert(scope)
    t("flash.#{scope}.alert")
  end

  def login_as(user, pass = '123456')
    visit root_path
    click_link t('menu.login')

    fill_in label('user.email'), with: user.email
    fill_in label('user.password'), with: pass
    click_button button('login')
  end

  teardown do
    Capybara.reset_sessions!
  end

  class ActionMailer::TestCase
    include Rails.application.routes.url_helpers
    def default_url_options(options = {})
      options.merge(ActionMailer::Base.default_url_options)
    end
  end
end
