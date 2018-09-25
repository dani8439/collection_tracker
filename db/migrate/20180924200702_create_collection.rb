class CreateCollection < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :pattern_id
      t.string :pattern_name
      t.integer :piece_id
      t.string :piece_name
      t.integer :quantity
      t.integer :user_id
    end
  end
end
