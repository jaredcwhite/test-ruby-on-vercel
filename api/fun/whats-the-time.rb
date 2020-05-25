require "bridgetown-core/version"
require "phaedra"

class Handler < Phaedra::Base
  before_action :foobar
  after_action :gfitzblick
  around_action :wacky

  def wacky
    p "I am around 1!"
    yield
    p "I am around 2!"
  end

  def foobar
    request.query["search"] += "HAHAHA" if request.query["search"]

    if request.body
      request.body.sub!("Works", "Fucks")
    end

    p "I am a BEFORE ACTION!!!"
  end

  def gfitzblick
    response.status = 201
    if response.body.is_a?(Hash)
      response.body[:version] += " ya LOOSER"
    end

    p "I am a AFTER ACTION!!!"
  end

  def get(params)
    response["Content-Type"] = 'text/plain; charset=utf-8'
    "The Current Time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION} | params: #{params[:search]}"
  end

  def post(params)
    {
      body: "I am a 😃 Posted response! | params #{params[:input]}",
      version: "v#{Bridgetown::VERSION}"
    }
  end

  def put(params)
    return post(params)
    {body: "I am a 😃 PUTTED response! | params #{params[:input]}", version: "v#{Bridgetown::VERSION}"}
  end

  def delete(params)
    {body: "I am a 😃 DELETED response! | params #{params[:input]}", version: "v#{Bridgetown::VERSION}"}
  end
end
