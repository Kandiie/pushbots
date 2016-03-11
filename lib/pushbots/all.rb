module Pushbots
  # All class
  class All < Push
    attr_accessor :schedule, :tags, :sound, :badge, :except_tags, :alias,
                  :except_alias, :payload

    def initialize(platforms, message, schedule, options = {})
      super(platforms, message, :all)
      self.schedule = schedule
      self.tags = options[:tags]
      self.sound = options[:sound]
      self.badge = options[:badge]
      self.except_tags = options[:except_tags]
      self.alias = options[:alias]
      self.except_alias = options[:except_alias]
      self.payload = options[:payload]
    end

    def send
      request = Request.new(body, :all)
      self.response = request.send
      self.status =
        response.failed? ? STATUS[:failed] : STATUS[:delivered]
    end

    def body
      data = {
        platform: @platform,
        msg: message,
        schedule: schedule
      }
      data[:tags] if tags
      data[:badge] if badge
      data[:payload] if payload
      data
    end
  end
end
