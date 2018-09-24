class Piece < ActiveRecord::Base
  # has_and_belongs_to_many :patterns
  belongs_to :user
end
