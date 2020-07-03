require_relative "../phaedra/initializers"

class PhaedraFunction < Phaedra::Base
  def get(params)
    response["Content-Type"] = "text/html"
    "<p>This is interesting! #{Phaedra::Shared.start_time} / #{Time.now}</p>"
  end

  def post(params)
    {
      file_contents: params[:filedata]
    }
  end
end

Handler = PhaedraFunction