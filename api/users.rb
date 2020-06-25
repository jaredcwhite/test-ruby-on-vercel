require_relative "../phaedra/initializers"
require_relative "../phaedra/models"

class PhaedraFunction < Phaedra::Base
  def get(params)
    errors = verify_params(params)
    return errors if errors

    user = User.find_login(params[:user_email].downcase, params[:user_password])
    user_hash = user&.as_json
    user_hash.delete("password") if user_hash

    {
      status: "complete",
      token: user.present? ? Phaedra::Auth.jwt_for_user(user) : nil,
      verified: user.present?,
      user: user_hash
    }
  end

  def post(params)
    errors = verify_params(params)
    return errors if errors

    User.create_with_password(params[:user_email].downcase, params[:user_password])

    { status: "complete" }
  end

  def verify_params(params)
    if params[:user_email].blank? || params[:user_password].blank?
      response.status = 400
      { status: "error", error: "Please specify an email and password" }
    end
  end
end

Handler = PhaedraFunction