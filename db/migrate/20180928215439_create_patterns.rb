class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :name
      t.string :quantity
      t.integer :user_id
    end
  end
end
