module Pushbots
  # Push class
  class One < Push
    attr_accessor :token, :sound, :badge, :payload, :json

    def initialize(platform, token, message, sound, options = {})
      super(platform, message)
      self.token = token
      self.sound = sound
      self.badge = options[:badge]
      self.payload = options[:payload]
      self.json = options[:json]
    end

    def send
      request = Request.new(body)
      self.response = request.send
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
      data[:json] if json
      data
    end
  end
end
