require 'pushbots/version'
require 'pushbots/config'
require 'pushbots/push'

# Pushbots module
module Pushbots
  def self.configure(&block)
    Config.configure(&block)
  end
end
