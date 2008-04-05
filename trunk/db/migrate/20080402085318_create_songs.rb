class CreateSongs < ActiveRecord::Migration
  def self.up
    create_table :songs do |t|
      t.integer :band_id
      t.string :name, :limit => 255
      t.text :lyrics, :limit => 10000

      t.timestamps
    end
  end

  def self.down
    drop_table :songs
  end
end
