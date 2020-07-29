Handler = Proc.new do |req, res|
  res["Content-Type"] = "application/octet-stream"
  res.body = "\xFF".b
end
