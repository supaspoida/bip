class CreatePages < ActiveRecord::Migration
  def self.up
    create_table :pages do |t|
      t.integer :user_id, :null => false
      t.string :title, :limit => 255, :null => false
      t.string :permalink
      t.text :body

      t.timestamps
    end
    Page.create(:user_id => 1, :title => "BIP 2.0", :permalink => "bip-home", :body => "Welcome to the new & improved BIP.")
  end

  def self.down
    drop_table :pages
  end
end
