class Piece < ActiveRecord::Base
  has_and_belongs_to_many :patterns
  # has_many :patternpieces
  # has_many :patterns, through: :patternpieces
  belongs_to :user
end
