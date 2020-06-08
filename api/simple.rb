require "phaedra"

class PhaedraFunction < Phaedra::Base
  def get(params)
    response["Content-Type"] = "text/html"
    "<p>This is interesting.</p>"
  end
end

Handler = PhaedraFunction