module Pushbots
  # Push class
  # Holds shared data between single and batch push notifications
  class Push
    attr_accessor :platform, :message, :status, :response
    PLATFORM_TYPE = { ios: 0, android: 1 }.freeze
    PLATFORM_TYPE_R = [:ios, :android].freeze

    STATUS = { created: 'created', delivered: 'delivered',
               failed: 'failed' }.freeze

    def initialize(platform, message)
      validates_platform(platform)
      self.platform = PLATFORM_TYPE[platform]
      self.message = message
      self.status = STATUS[:created]
    end

    def platform
      PLATFORM_TYPE_R[@platform.to_i]
    end

    private

    def validates_platform(platform)
      fail 'platform is not valid' if PLATFORM_TYPE[platform].nil?
    end
  end
end
