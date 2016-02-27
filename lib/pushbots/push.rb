require 'http'

module Pushbots
  # Push class
  class Push
    attr_accessor :token, :platafform, :message
    def initialize(token, platafform, message)
      @token = token
      @platafform = platafform
      @message = message
    end

    def deliver
      HTTP.headers(create_header).post(Config.config.pushbots_url,
                                       json: create_body)
    end

    private

    def create_header
      {
        :'X-PushBots-AppID' => Config.config.application_id,
        :'X-PushBots-Secret' => Config.config.application_secret,
        :'Content-Type' => 'application/json'
      }
    end

    def create_body
      {
        platform: '0',
        token: @token,
        msg: @message,
        sound: 'sa'
      }
    end
  end
end
