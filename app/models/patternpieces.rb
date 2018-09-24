class PatternPieces < ActiveRecord::Base
  belongs_to :pattern
  belongs_to :piece
end
