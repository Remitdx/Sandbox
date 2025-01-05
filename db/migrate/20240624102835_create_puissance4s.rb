class CreatePuissance4s < ActiveRecord::Migration[7.0]
  def change
    create_table :puissance4s do |t|
      t.integer :gameover
      t.integer :grid, array: true
      t.string :players, array: true, default: [ 'p1', 'p2' ]
      t.integer :lastplay, array: true

      t.timestamps
    end
  end
end
