class RemoveBandIdFromSetlist < ActiveRecord::Migration
  def self.up
    remove_column :setlists, :band_id

  end

  def self.down
    add_column :setlists, :band_id, :integer

  end
end
