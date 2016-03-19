require 'webmock/rspec'
module Requests
  def single_device_requests
    token = 'token'
    message = 'Hello World!!!'
    sound = 'sound'
    # Valid data
    pushbots_single_request(:post, token, message, sound, 200)
    # Empty or nil token returns status 400
    pushbots_single_request(:post, '', message, sound, 400)
    pushbots_single_request(:post, nil, message, sound, 400)
    # Empty or nil message returns status 400
    pushbots_single_request(:post, token, '', sound, 400)
    pushbots_single_request(:post, token, nil, sound, 400)
    # Empty or nil sound returns status 400
    pushbots_single_request(:post, token, message, '', 400)
    pushbots_single_request(:post, token, message, nil, 400)
  end

  def multiple_device_requests
    msg = 'Hello World!!!'
    schedule = '2016-03-14T19:25:53-06:00'
    # Multiple device requests
    pushbots_multiple_request(:post, msg, schedule, 200)
    # Empty or nil msg
    pushbots_multiple_request(:post, nil, schedule, 400)
    pushbots_multiple_request(:post, '', schedule, 400)
    # Empty or nil schedule
    pushbots_multiple_request(:post, msg, '', 400)
    pushbots_multiple_request(:post, msg, nil, 400)
  end

  private

  def common_headers
    {
      'Connection' => 'close',
      'Content-Type' => 'application/json',
      'Host' => 'api.pushbots.com',
      'User-Agent' => /./,
      'X-Pushbots-Appid' => 'Application ID',
      'X-Pushbots-Secret' => 'Application Secret'
    }
  end

  def single_device_content(token, msg, sound)
    { 'platform' => 1,
      'token' => token,
      'msg' => msg,
      'sound' => sound
    }.to_json
  end

  def multiple_device_content(platforms, msg, schedule)
    { 'platform' => platforms,
      'msg' => msg,
      'schedule' => schedule
    }.to_json
  end

  def pushbots_single_request(method, token, message, sound, response)
    stub_request(method, 'https://api.pushbots.com/push/one')
      .with(body: single_device_content(token, message, sound),
            headers: common_headers)
      .to_return(status: response,
                 body: '',
                 headers: {})
  end

  def pushbots_multiple_request(method, msg, schedule, response)
    stub_request(method, 'https://api.pushbots.com/push/all')
      .with(body: multiple_device_content([0], msg,
                                          schedule),
            headers: common_headers)
      .to_return(status: response,
                 body: '',
                 headers: {})
  end
end
