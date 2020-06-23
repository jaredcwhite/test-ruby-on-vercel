require "phaedra"

module Phaedra
  Initializers.register self do
    start_time
  end

  def self.start_time
    @the_time ||= Time.now
  end
end