require "bridgetown"

class Handler < WEBrick::HTTPServlet::AbstractServlet
  def do_GET(req, res)
    res.status = 200
    res["Content-Type"] = 'text/plain'
    res.body = "The current Servlet time is: #{Time.new}, and Bridgetown is v#{Bridgetown::VERSION}"
  end

  def do_POST(req, res)
    setup_site

    liquid_output = Liquid::Template.parse("{% vercel Awesome %}").render

    res.status = 200
    res["Content-Type"] = 'application/json'
    res.body = '{"body": "I am a posted response!", "version": "v' + Bridgetown::VERSION.to_s + '", "liquid": ' + liquid_output.inspect + '}'
  end

  def setup_site
    site = Bridgetown::Site.new(Bridgetown.configuration)
    site.reset
    site.setup
    Bridgetown::Hooks.trigger :site, :pre_read
  end
end
