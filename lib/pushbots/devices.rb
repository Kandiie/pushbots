module Pushbots
  # Devices class
  class Devices
    attr_accessor :tokens, :platform, :tags
    PLATFORM_TYPE = { ios: 0, android: 1 }.freeze

    def initialize(tokens, platform, tags)
      self.tokens = tokens
      self.platform = platform
      self.tags = tags
    end

    def register
      body = {
        tokens: tokens,
        platform: PLATFORM_TYPE[platform],
        tags: tags
      }
      response = Request.register_batch(body)
      response.code == 201
    end
  end
end
