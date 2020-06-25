require "phaedra"
require "mongoid"
require "bcrypt"
require "digest"
require "jwt"

module Phaedra
  module Shared
    Initializers.register self do
      mongoid_init
      start_time
    end

    def self.start_time
      @the_time ||= Time.now
    end

    def self.mongoid_init
      Mongo::Logger.logger = Logger.new(STDERR).tap do |logger|
        logger.level = Logger::WARN
      end
      
      Mongoid.configure do |config|
        config.clients.default = {
          uri: "mongodb+srv://#{ENV["MONGO_USER"]}@phaedratest-lrcac.azure.mongodb.net/phaedrafun?retryWrites=true&w=majority"
        }
        config.log_level = :warn
        config.raise_not_found_error = false
      end
    end
  end

  module Auth
    def self.jwt_secret
      @jwt_secret ||= Digest::SHA256.hexdigest(ENV["MONGO_USER"])
    end

    def self.jwt_for_user(user)
      payload = { user_id: user.id.to_s }
      JWT.encode payload, jwt_secret, "HS256"
    end

    def self.user_from_jwt(token)
      decoded_token = JWT.decode token, jwt_secret, true, { algorithm: "HS256" }
      user_id = decoded_token[0]["user_id"]
      User.find_by(_id: user_id)
    rescue JWT::DecodeError => e
      p e
      nil
    end
  end
end
