class CreatePuzzles < ActiveRecord::Migration[8.0]
  def change
    create_table :puzzles do |t|
      t.integer :gameover
      t.string :pseudo
      t.integer :size
      t.integer :counter
      t.integer :value, array: true

      t.timestamps
    end
  end
end
