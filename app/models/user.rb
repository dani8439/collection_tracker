class User < ActiveRecord::Base
  has_many :pieces
  has_many :patterns
  has_secure_password
end
