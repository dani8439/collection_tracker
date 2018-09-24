class Users < ActiveRecord::Base
  has_many :pieces
  has_many :patterns, through: :pieces
end
