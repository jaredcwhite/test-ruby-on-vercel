require_relative "../phaedra/initializers"
require_relative "../phaedra/models"
require_relative "../phaedra/concerns/bearer"

class PhaedraFunction < Phaedra::Base
  include Bearer

  def get(params)
    "Yay, I'm protected! #{current_user.inspect}"
  end
end