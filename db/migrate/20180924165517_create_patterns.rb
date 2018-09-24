class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :pattern_name
      t.string :colorway
    end
  end
end
