require "phaedra"

run Phaedra::RackApp.new({
  "serverless_api_dir" => "phaedra/api"
})