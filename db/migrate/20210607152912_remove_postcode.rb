class RemovePostcode < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :posctode, :string
  end
end
