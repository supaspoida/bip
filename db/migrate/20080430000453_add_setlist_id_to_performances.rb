class AddSetlistIdToPerformances < ActiveRecord::Migration
  def self.up
    add_column :performances, :setlist_id, :integer

  end

  def self.down
    remove_column :performances, :setlist_id

  end
end
