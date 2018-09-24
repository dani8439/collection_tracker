class Piece < ActiveRecord::Base
  # has_and_belongs_to_many :patterns
  has_many :collections
  has_many :patterns, through: :collections
  belongs_to :user
end
