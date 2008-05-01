class RemoveAppearanceIdFromPerformance < ActiveRecord::Migration
  def self.up
    remove_column :performances, :appearance_id
  end

  def self.down
    add_column :performances, :appearance_id, :integer
  end
end
