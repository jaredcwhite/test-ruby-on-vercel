Handler = Proc.new do |req, res|
  res["Content-Type"] = "application/octet-stream; charset=utf-8"
  png = "\x89PNG\r\n\u001A\n\u0000\u0000\u0000\rIHDR\u0000\u0000\u0000\u0001\u0000\u0000\u0000\u0001\b\u0006\u0000\u0000\u0000\u001F\u0015ĉ\u0000\u0000\u0000\rIDATx\xDAc\xFC\xFF\x9F\xE1?\u0000\b\u0002\u0002\xFF\xE1\xDDc\xF3\u0000\u0000\u0000\u0000IEND\xAEB`\x82"
  res.body = png
end
