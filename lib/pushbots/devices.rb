module Pushbots
  # Devices class
  class Devices
    attr_accessor :tokens, :platform, :tags
    PLATFORM_TYPE = { ios: 0, android: 1 }.freeze

    def initialize(tokens, platform, tags = nil)
      self.tokens = tokens
      self.platform = platform
      self.tags = tags if tags
    end

    def register
      body = { tokens: tokens, platform: PLATFORM_TYPE[platform] }
      body[:tags] = tags if tags
      response = Request.register_batch(body)
      response.code == 201
    end
  end
end
