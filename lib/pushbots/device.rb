module Pushbots
  # Device class
  class Device
    attr_accessor :token, :platform, :tags
    PLATFORM_TYPE = { ios: 0, android: 1, chrome: 2 }.freeze
    PLATFORM_TYPE_R = [:ios, :android, :chrome].freeze

    def initialize(token, platform = nil)
      self.token = token
      self.platform = platform if platform
    end

    def info
      response = Request.info(token)
      if response.code == 200
        http_response = JSON.parse(response)
        self.platform = PLATFORM_TYPE_R[http_response['platform']]
        self.tags = http_response['tags']
      end
    end

    def register
      body = { token: token, platform: PLATFORM_TYPE[platform] }
      response = Request.register(body)
      response.code == 201
    end

    def delete
      body = { token: token, platform: PLATFORM_TYPE[platform] }
      response = Request.delete(body)
      response.code == 200
    end
  end
end
