module Pushbots
  class Config
    attr_accessor :application_id, :application_secret

    class << self
      attr_accessor :config
    end

    def self.config
      @config ||=  Config.new
    end

    def self.configure
      yield(config) if block_given?
    end
  end
end
