class CreateEscapes < ActiveRecord::Migration[8.0]
  def change
    create_table :escapes do |t|
      t.integer :room
      t.integer :text
      t.integer :score
      t.text :parameters

      t.timestamps
    end
  end
end
