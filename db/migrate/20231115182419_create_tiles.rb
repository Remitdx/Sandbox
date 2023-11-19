class CreateTiles < ActiveRecord::Migration[7.0]
  def change
    create_table :tiles do |t|
      t.string :field
      t.boolean :built
      t.string :resource

      t.timestamps
    end
  end
end
