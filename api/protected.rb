require_relative "../phaedra/initializers"
require_relative "../phaedra/models"
require_relative "../phaedra/concerns/bearer"

class PhaedraFunction < Phaedra::Base
  include Bearer

  def get(params)
    "Yay, this endpoint is protected! User: #{current_user.email}"
  end
end

Handler = PhaedraFunction