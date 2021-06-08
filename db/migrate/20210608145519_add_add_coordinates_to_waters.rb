class AddAddCoordinatesToWaters < ActiveRecord::Migration[6.0]
  def change
    add_column :waters, :latitude, :float
    add_column :waters, :longitude, :float
  end
end
