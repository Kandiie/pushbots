module Pushbots
  # Push class
  class One < Push
    attr_accessor :token, :sound, :badge, :payload

    def initialize(platform, token, message, sound, options = {})
      super(platform, message, :one)
      self.token = token
      self.sound = sound
      self.badge = options[:badge]
      self.payload = options[:payload]
    end

    def send
      # request = Request.new(body, :one)
      self.response = Request.send(:one, body)
      self.status =
        response.failed? ? STATUS[:failed] : STATUS[:delivered]
    end

    def body
      data = {
        platform: @platform,
        token: token,
        msg: message,
        sound: sound
      }
      data[:badge] if badge
      data[:payload] if payload
      data
    end
  end
end
