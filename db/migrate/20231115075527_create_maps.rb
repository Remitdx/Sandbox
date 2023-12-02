class CreateMaps < ActiveRecord::Migration[7.0]
  def change
    create_table :maps do |t|
      t.string :weather
      t.integer :maxplayer
      t.integer :size
      t.integer :lines
      t.integer :columns
      t.belongs_to :risk, index: true

      t.timestamps
    end
  end
end
