class CreateSetlists < ActiveRecord::Migration
  def self.up
    create_table :setlists do |t|
      t.integer :appearance_id, :band_id, :user_id, :performances_cache
      t.boolean :approved

      t.timestamps
    end
  end

  def self.down
    drop_table :setlists
  end
end
