Handler = Proc.new do |req, res|
  res["Content-Type"] = "application/octet-stream; charset=utf-8"
  res.body = "\xFF".b
end
