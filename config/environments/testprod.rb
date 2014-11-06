# based off production defaults
require Rails.root.join('config/environments/production')

Dpoll::Application.configure do
  config.action_mailer.default_url_options = { host: 'testdpoll.test.dius.com.au', port: 8080 }
end
