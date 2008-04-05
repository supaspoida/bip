class CreatePerformances < ActiveRecord::Migration
  def self.up
    create_table :performances do |t|
      t.integer :appearance_id, :song_id, :position
      t.text :notes, :limit => 1000
      t.boolean :segue

      t.timestamps
    end
  end

  def self.down
    drop_table :performances
  end
end
