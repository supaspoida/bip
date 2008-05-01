class CreateShows < ActiveRecord::Migration
  def self.up
    create_table :shows do |t|
      t.integer :venue_id
      t.datetime :date, :announced_at
      t.time :doors
      t.text :notes, :limit => 10000

      t.timestamps
    end
  end

  def self.down
    drop_table :shows
  end
end
