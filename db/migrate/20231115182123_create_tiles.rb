class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.string :field
      t.boolean :built
      t.string :resource
      t.integer :x
      t.integer :y
      t.belongs_to :map, index: true

      t.timestamps
    end
  end
end
