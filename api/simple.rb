require_relative "../phaedra/initializers"

class PhaedraFunction < Phaedra::Base
  def get(params)
    "\xFF".b
#    response["Content-Type"] = "text/html"
#    "<p>This is interesting! #{Phaedra.start_time} / #{Time.now}</p>"
  end
end

Handler = PhaedraFunction