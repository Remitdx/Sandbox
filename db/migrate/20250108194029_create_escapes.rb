class CreateEscapes < ActiveRecord::Migration[8.0]
  def change
    create_table :escapes do |t|
      t.integer :map, array: true
      t.integer :character_x
      t.integer :character_y
      t.integer :text
      t.boolean :turbo_computer
      t.boolean :turbo_map
      t.boolean :turbo_text
      t.integer :score
      t.text :parameters

      t.timestamps
    end
  end
end
