# helper for handling requests.
require 'net/http'

module HttpHelper
  class App
    def initialize(host: nil, port: nil)
      @host = host
      @port = port
    end

    def get(path)
      Net::HTTP.get_response(@host, path, @port)
    end
  end
end