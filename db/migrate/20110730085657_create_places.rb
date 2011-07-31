class CreatePlaces < ActiveRecord::Migration
  def self.up
    create_table :places do |t|
      t.string :name
      t.string :address
      t.float :latitude, :default => 0, :null => false
      t.float :longitude, :default => 0, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :places
  end
end
