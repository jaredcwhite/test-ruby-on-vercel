require "active_support/concern"

module Bearer
  extend ActiveSupport::Concern

  included do
    attr_accessor :current_user
    before_action :verify_bearer
  end

  def verify_bearer
    auth_header = request.header["http_authorization"]
    if auth_header
      token = auth_header.sub(/Bearer[ ]+/, "")
      return self.current_user = Phaedra::Auth.user_from_jwt(token)
    end

# Currently not supported by Phaedra in callbacks
#    response.status = 403
#    response.body = "403 Forbidden"
    throw :abort
  end
end