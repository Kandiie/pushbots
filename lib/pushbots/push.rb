module Pushbots
  # Push class
  # Holds shared data between single and batch push notifications
  class Push
    attr_accessor :platform, :message, :status, :response, :type
    PLATFORM_TYPE = { ios: 0, android: 1, chrome: 2 }.freeze
    PLATFORM_TYPE_R = [:ios, :android, :chrome].freeze

    STATUS = { created: 'created', delivered: 'delivered',
               failed: 'failed' }.freeze

    def initialize(platform, message, type)
      self.type = type
      if type == :one
        validates_platform(platform)
        self.platform = PLATFORM_TYPE[platform]
      elsif type == :all
        validates_platforms(platform)
        self.platform = platform.map { |t| PLATFORM_TYPE[t] }
      end
      self.message = message
      self.status = STATUS[:created]
    end

    def platform
      PLATFORM_TYPE_R[@platform.to_i] if type == :one
      @platform.map { |t| PLATFORM_TYPE_R[t] } if type == :all
    end

    private

    def validates_platform(platform)
      raise 'platform is not valid' if PLATFORM_TYPE[platform].nil?
    end

    def validates_platforms(platforms)
      raise 'platform is not valid' if platforms.empty?
      platforms.each do |t|
        validates_platform(t)
      end
    end
  end
end
