class CreateWaters < ActiveRecord::Migration[6.0]
  def change
    create_table :waters do |t|
      t.string :name
      t.string :brand
      t.string :description
      t.integer :ph
      t.string :source
      t.string :country

      t.timestamps
    end
  end
end
