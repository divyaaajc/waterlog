class CreateWaterTags < ActiveRecord::Migration[6.0]
  def change
    create_table :water_tags do |t|
      t.references :water, null: false, foreign_key: true
      t.references :tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
