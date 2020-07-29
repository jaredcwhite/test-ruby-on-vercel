require_relative "../phaedra/initializers"

class PhaedraFunction < Phaedra::Base
  def get(params)
    response["Content-Type"] = "application/octet-stream"
    "\xFF".b
#    response["Content-Type"] = "text/html"
#    "<p>This is interesting! #{Phaedra.start_time} / #{Time.now}</p>"
  end
end

Handler = PhaedraFunction