require "bridgetown-core/version"

class Handler < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res.status = 200
    res["Content-Type"] = 'text/plain'
    res.body = "The current Servlet time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION}"
  end

  def do_POST(req, res)
    res.status = 200
    res["Content-Type"] = 'application/json'
    res.body = '{"body": "I am a posted response!", "version": "v' + Bridgetown::VERSION.to_s + '"}'
  end
end
