require 'http'

module Pushbots
  # Request class
  class Request
    attr_accessor :body

    def initialize(body)
      self.body = body
    end

    def send
      response = HTTP.headers(header).post(Config.config.pushbots_url,
                                           json: body)
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
