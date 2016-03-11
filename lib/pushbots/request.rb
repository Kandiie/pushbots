require 'http'

module Pushbots
  # Request class
  class Request
    attr_accessor :body, :base_url

    def initialize(body, base_url)
      self.body = body
      self.base_url = base_url
    end

    def send
      url = "https://api.pushbots.com/push/#{base_url}"
      response = HTTP.headers(header).post(url, json: body)
      Response.new(response)
    end

    def header
      {
        'X-PushBots-AppID' => Config.config.application_id,
        'X-PushBots-Secret' => Config.config.application_secret,
        'Content-Type' => 'application/json'
      }
    end
  end
end
