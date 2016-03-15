$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pushbots'
require 'net/http'
require 'requests'
WebMock.disable_net_connect!(allow_localhost: true)

# Stub Request common headers
RSpec.configure do |config|
  config.include Requests
  config.before(:each) do
    single_device_requests
    multiple_device_requests
  end
end

Pushbots.configure do |config|
  config.application_id = 'Application ID'
  config.application_secret = 'Application Secret'
end
