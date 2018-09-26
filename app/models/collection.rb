class Collection < ActiveRecord::Base
  # belongs_to :piece
  # belongs_to :pattern
  belongs_to :user
  belongs_to :piece
  belongs_to :pattern
end
