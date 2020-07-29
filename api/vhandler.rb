Handler = Proc.new do |req, res|
  res["Content-Type"] = "application/octet-stream; charset=ASCII-8BIT"
  res.body = "\xFF".b
end
