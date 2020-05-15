require "bridgetown-core/version"
require_relative "../lib/nice_server"

class Handler < NiceServer
  def get(params)
    @res["Content-Type"] = 'text/plain'
    "The Current Time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION} | params: #{params["search"]}"
  end

  def post(params)
    {body: "I am a Posted response! | params #{params["input"]}", version: "v#{Bridgetown::VERSION}"}
  end
end
