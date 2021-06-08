class AddPhotoToWater < ActiveRecord::Migration[6.0]
  def change
    add_column :waters, :photo, :string
  end
end
