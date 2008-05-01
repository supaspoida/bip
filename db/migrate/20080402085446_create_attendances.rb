class CreateAttendances < ActiveRecord::Migration
  def self.up
    create_table :attendances do |t|
      t.integer :user_id, :show_id

      t.timestamps
    end
  end

  def self.down
    drop_table :attendances
  end
end
