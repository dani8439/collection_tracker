class CreateCollection < ActiveRecord::Migration
  def change
    create_table :collections do |t|
      t.integer :pattern_id 
      t.integer :piece_id 
      t.integer :user_id
    end
  end
end
