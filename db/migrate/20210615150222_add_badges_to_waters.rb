class AddBadgesToWaters < ActiveRecord::Migration[6.0]
  def change
    add_column :waters, :rare, :boolean
    add_column :waters, :highly_rated, :boolean
    add_column :waters, :popular, :boolean
  end
end
