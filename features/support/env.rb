require 'cucumber/rails'

# require 'webmock/cucumber'
# WebMock.allow_net_connect!

# require 'simplecov'
# SimpleCov.command_name 'Cucumber'

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise 'You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it.'
end

Before do |_scenario|
  # Rails.logger.debug "Starting scenario: #{scenario.title}"
end

# Possible values are :truncation and :transaction
# The :transaction strategy is faster, but might give you threading problems.
# See https://github.com/cucumber/cucumber-rails/blob/master/features/choose_javascript_database_strategy.feature
Cucumber::Rails::Database.javascript_strategy = :truncation

# Around('@email') do |scenario, block|
#   ActionMailer::Base.delivery_method = :test
#   ActionMailer::Base.perform_deliveries = true
#   ActionMailer::Base.deliveries.clear
#   block.call
# end

require "#{Rails.root}/db/seeds.rb"

Capybara.register_driver :chrome do |app|
  Capybara::Selenium::Driver.new(app, browser: :chrome)
end
Capybara.javascript_driver = :chrome
Capybara.default_wait_time = 5
