require "bridgetown-core/version"

Handler = Proc.new do |req, res|
  res.status = 200
  res["Content-Type"] = 'text/plain'
  res.body = "The current time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION}"
end
