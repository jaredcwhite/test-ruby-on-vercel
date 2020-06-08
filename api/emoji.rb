Handler = Proc.new do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/plain'
  res.body = "Ruby FTW! 🙌"
end