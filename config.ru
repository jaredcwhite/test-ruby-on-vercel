require "phaedra/rack_app"
require "phaedra/rack_middleware"

use Phaedra::Middleware::Static, root: "output", urls: %w[/]
use Phaedra::Middleware::NotFound, "output/404.html"
run Phaedra::RackApp.new
