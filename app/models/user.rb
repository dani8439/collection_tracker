class User < ActiveRecord::Base
  has_many :collections
  has_many :pieces, through: :collections
  has_many :patterns, through: :collections
  has_secure_password
end
