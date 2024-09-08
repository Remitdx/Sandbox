class CreateDikkeneks < ActiveRecord::Migration[7.0]
  def change
    create_table :dikkeneks do |t|
      t.integer :gameover
      t.text :quotes
      t.integer :answers, array: true
      t.integer :score
      t.string :pseudo

      t.timestamps
    end
  end
end
