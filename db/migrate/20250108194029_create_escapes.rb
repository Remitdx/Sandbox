class CreateEscapes < ActiveRecord::Migration[8.0]
  def change
    create_table :escapes do |t|
      t.integer :step
      t.integer :text
      t.integer :map, array: true
      t.integer :score
      t.text :parameters

      t.timestamps
    end
  end
end
