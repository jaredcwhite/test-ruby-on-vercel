module BSON
  class ObjectId
    alias :as_json :to_s
  end
end

class User
  include Mongoid::Document

  field :email, type: String
  field :password, type: String

  def self.create_with_password(email, password)
    create(email: email, password: encrypt_password(password))
  end

  def self.find_login(email, password)
    u = find_by(email: email)
    verify_password(u.password, password) ? u : nil
  rescue Mongoid::Errors::DocumentNotFound
    nil
  end

  def self.encrypt_password(raw_password)
    BCrypt::Password.create(raw_password)
  end

  def self.verify_password(encrypted_password, raw_password)
    BCrypt::Password.new(encrypted_password) == raw_password
  end
end