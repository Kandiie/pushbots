require 'pushbots/version'
require 'pushbots/config'

module Pushbots
  def self.configure(&block)
    Config.configure(&block)
  end
end
