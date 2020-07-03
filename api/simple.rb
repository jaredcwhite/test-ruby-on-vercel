require_relative "../phaedra/initializers"

class PhaedraFunction < Phaedra::Base
  def get(params)
    response["Content-Type"] = "text/html; charset=utf-8"
    "<p>This is interesting! 😎 #{Phaedra::Shared.start_time} / #{Time.now}</p>"
  end

  def post(params)
    {
      file_contents_length: params[:filedata].length
    }
  end
end

Handler = PhaedraFunction