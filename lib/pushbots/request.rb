require 'http'

module Pushbots
  # Request class
  class Request
    def self.send(type, body)
      url = "https://api.pushbots.com/push/#{type}"
      header = header_base.merge(header_push)
      response = HTTP.headers(header).post(url, json: body)
      Response.new(response)
    end

    def self.info(token)
      url = 'https://api.pushbots.com/deviceToken/one'
      header = header_base.merge(header_info(token))
      HTTP.headers(header).get(url)
    end

    def self.register(body)
      url = 'https://api.pushbots.com/deviceToken'
      HTTP.headers(header_base).put(url, json: body)
    end

    def self.delete(body)
      url = 'https://api.pushbots.com/deviceToken/del'
      HTTP.headers(header_base).put(url, json: body)
    end

    def self.register_batch(body)
      url = 'https://api.pushbots.com/deviceToken/batch'
      header = header_base.merge(header_push)
      HTTP.headers(header).put(url, json: body)
    end

    def self.header_base
      {
        :'X-PushBots-AppID' => Config.config.application_id,
        :'Content-Type' => 'application/json'
      }
    end

    def self.header_push
      {
        :'X-PushBots-Secret' => Config.config.application_secret
      }
    end

    def self.header_info(token)
      {
        token: token
      }
    end
  end
end
