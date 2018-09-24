class Pattern < ActiveRecord::Base
  # has_and_belongs_to_many :pieces
  has_many :collections
  has_many :pieces, through: :collections
  belongs_to :user
end
