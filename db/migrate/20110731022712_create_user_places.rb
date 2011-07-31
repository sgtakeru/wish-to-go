class CreateUserPlaces < ActiveRecord::Migration
  def self.up
    create_table :user_places do |t|
      t.references :user
      t.references :place
      t.integer :star, :default => 0, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :user_places
  end
end
