class CreateAppearances < ActiveRecord::Migration
  def self.up
    create_table :appearances do |t|
      t.integer :band_id, :show_id
      t.boolean :headliner
      t.text :notes, :limit => 2000

      t.timestamps
    end
  end

  def self.down
    drop_table :appearances
  end
end
