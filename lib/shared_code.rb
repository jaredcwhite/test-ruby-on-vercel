module SharedCode
  def self.run_once
    @one_time ||= Time.now

    @one_time
  end
end