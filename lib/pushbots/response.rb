module Pushbots
  # Response class
  class Response
    attr_accessor :code, :message

    def initialize(http_response)
      self.code = http_response.code
      if http_response.to_s.empty?
        self.message = 'OK'
      else
        http_response = JSON.parse(http_response)
        self.message = "#{http_response['code']}: #{http_response['message']}"
      end
    end

    def failed?
      code != 200
    end

    def to_s
      "{code: #{code}, message: #{message}}"
    end
  end
end
