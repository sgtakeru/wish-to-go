class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :provider, :null => false
      t.string :uid, :null => false
      t.string :screen_name, :null => false
      t.string :name, :null => false

      t.timestamps
    end
    add_index :users, [:provider, :uid]
    add_index :users, [:screen_name]
  end

  def self.down
    drop_table :users
  end
end
