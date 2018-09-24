class User < ActiveRecord::Base
  has_many :pieces
  has_many :patterns
  # has_many :collections ?
  has_secure_password
end
