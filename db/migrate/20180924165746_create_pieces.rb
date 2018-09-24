class CreatePieces < ActiveRecord::Migration
  def change
    create_table :pieces do |t|
      t.string :name
      t.string :shape_class
      t.string :size
      t.integer :quantity
    end
  end
end