class CreatePuissance4s < ActiveRecord::Migration[7.0]
  def change
    create_table :puissance4s do |t|
      t.integer :gameover
      t.integer :grid, array: true
      t.string :players, array: true, default: [ 'Player 1', 'Player 2' ]

      t.timestamps
    end
  end
end
