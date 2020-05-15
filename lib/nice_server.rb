class NiceServer < WEBrick::HTTPServlet::AbstractServlet
  def get(params)
    {}
  end

  def post(params)
    {}
  end

  def do_GET(req, res)
    @req = req
    @res = res

    @res.status = 200
    @res["Content-Type"] = 'application/json'
    body = get(@req.query)
    
    if @res["Content-Type"] == 'application/json' # hasn't changed…
      @res.body = body.to_json.force_encoding("UTF-8").encode("UTF-8")
    else
      @res.body = body.force_encoding("UTF-8").encode("UTF-8")
    end
  end

  def do_POST(req, res)
    @req = req
    @res = res

    @res.status = 200
    @res["Content-Type"] = 'application/json'

    params = if @req.header["content-type"].to_s.include?("multipart/form-data")
      @req.query
    else
      JSON.parse(@req.body)
    end

    body = post(params)

    if @res["Content-Type"] == 'application/json' # hasn't changed…
      @res.body = body.to_json.force_encoding("UTF-8").encode("UTF-8")
    else
      @res.body = body.force_encoding("UTF-8").encode("UTF-8")
    end
  end
end