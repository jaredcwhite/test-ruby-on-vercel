module SharedCode
  def self.run_once
    @one_time = Time.now
  end
end