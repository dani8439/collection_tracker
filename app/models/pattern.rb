class Pattern < ActiveRecord::Base
  has_and_belongs_to_many :pieces
  # has_many :patternpieces
  # has_many :pieces, through: :patternpieces
  belongs_to :user
end
