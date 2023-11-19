class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :weather
      t.integer :maxplayer
      t.integer :size

      t.timestamps
    end
  end
end
