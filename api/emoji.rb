Handler = Proc.new do |req, res|
  res.status = 200
  res['Content-Type'] = 'text/plain; charset=utf-8'
  res.body = "Ruby FTW! 🙌"
end