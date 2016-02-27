module Pushbots
  # Config class
  class Config
    attr_accessor :application_id, :application_secret
    attr_reader :pushbots_url
    class << self
      attr_accessor :config
    end

    def initialize
      @pushbots_url = 'https://api.pushbots.com/push/one'
    end

    def self.config
      @config ||= Config.new
    end

    def self.configure
      yield(config) if block_given?
    end
  end
end
