require "bridgetown-core/version"
require_relative "../lib/nice_server"

Encoding.default_external = Encoding::UTF_8

class Handler < NiceServer
  def get(params)
    @res["Content-Type"] = 'text/plain; charset=utf-8'
    "The Current Time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION} | params: #{params["search"]}"
  end

  def post(params)
    {body: "I am a 😃 Posted response! | params #{params["input"]}", version: "v#{Bridgetown::VERSION}"}
  end
end
