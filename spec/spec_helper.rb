$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'pushbots'
require 'net/http'
require 'webmock/rspec'
WebMock.disable_net_connect!(allow_localhost: true)

# Stub Request common headers
common_headers = { 'Connection' => 'close',
                   'Content-Type' => 'application/json',
                   'Host' => 'api.pushbots.com',
                   'User-Agent' => 'http.rb/1.0.2',
                   'X-Pushbots-Appid' => 'Application ID',
                   'X-Pushbots-Secret' => 'Application Secret' }

api_path = 'https://api.pushbots.com/push/one'

RSpec.configure do |config|
  config.before(:each) do
    # Valid data
    content = { 'platform' => 0,
                'token' => 'token',
                'msg' => 'Hello World!!!',
                'sound' => 'sound' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 200,
                 body: '',
                 headers: {})

    # Empty token returns status 400
    content = { 'platform' => 0,
                'token' => '',
                'msg' => 'Hello World!!!',
                'sound' => 'sound' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})

    # Null token returns status 400
    content = { 'platform' => 0,
                'token' => nil,
                'msg' => 'Hello World!!!',
                'sound' => 'sound' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})

    # Empty message returns status 400
    content = { 'platform' => 0,
                'token' => 'token',
                'msg' => '',
                'sound' => 'sound' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})

    # Null message returns status 400
    content = { 'platform' => 0,
                'token' => 'token',
                'msg' => nil,
                'sound' => 'sound' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})

    # Empty sound returns status 400
    content = { 'platform' => 0,
                'token' => 'token',
                'msg' => 'Hello World!!!',
                'sound' => '' }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})

    # Null sound returns status 400
    content = { 'platform' => 0,
                'token' => 'token',
                'msg' => 'Hello World!!!',
                'sound' => nil }
    stub_request(:post, api_path)
      .with(body: content.to_json,
            headers: common_headers)
      .to_return(status: 400,
                 body: '',
                 headers: {})
  end
end

Pushbots.configure do |config|
  config.application_id = 'Application ID'
  config.application_secret = 'Application Secret'
end
