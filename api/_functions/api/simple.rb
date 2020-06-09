require "phaedra"

require_relative "../../../lib/shared_code"

class PhaedraFunction < Phaedra::Base
  def get(params)
    response["Content-Type"] = "text/html; charset=utf-8"
    "<p>This is interesting. 🙌 #{SharedCode.run_once} / #{Time.now}</p>"
  end
end
