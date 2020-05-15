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
    @res["Content-Type"] = 'application/json; charset=utf-8'
    body = get(@req.query)
    
    if @res["Content-Type"] == 'application/json; charset=utf-8' # hasn't changed…
      @res.body = body.to_json.force_encoding Encoding::UTF_8
    else
      @res.body = body.force_encoding Encoding::UTF_8
    end
  end

  def do_POST(req, res)
    @req = req
    @res = res

    @res.status = 200
    @res["Content-Type"] = 'application/json; charset=utf-8'

    params = if @req.header["content-type"].to_s.include?("multipart/form-data")
      @req.query
    else
      JSON.parse(@req.body)
    end

    body = post(params)

    if @res["Content-Type"] == 'application/json; charset=utf-8' # hasn't changed…
      @res.body = body.to_json.force_encoding Encoding::UTF_8
    else
      @res.body = body.force_encoding Encoding::UTF_8
    end
  end
end