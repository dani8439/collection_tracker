class CreatePatternAndPieces < ActiveRecord::Migration
  def changec
    create_table :pattern_pieces do |t|
      t.integer :pattern_id
      t.integer :piece_id
      t.integer :quantity
    end
  end
end
