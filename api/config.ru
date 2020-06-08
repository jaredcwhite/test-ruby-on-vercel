require "phaedra"

run Phaedra::RackApp.new({
  "serverless_api_dir" => "../functions"
})