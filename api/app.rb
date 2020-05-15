require "bridgetown-core/version"
require 'sinatra'

get "/*" do
  "The current Sinatra time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION} | params: #{params}"
end

post "/*" do
  headers "Content-Type" => "application/json"
  {body: "I am a posted response!", version: "v#{Bridgetown::VERSION}"}.to_json
end
