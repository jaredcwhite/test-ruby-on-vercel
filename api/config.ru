require "phaedra"

run Phaedra::RackApp.new({
  "root_dir" => File.join(__dir__, "_functions"),
  "serverless_api_dir" => "api"
})