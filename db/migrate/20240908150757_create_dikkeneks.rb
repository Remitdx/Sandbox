class CreateDikkeneks < ActiveRecord::Migration[7.0]
  def change
    create_table :dikkeneks do |t|
      t.string :pseudo
      t.text :quotes
      t.integer :gameover
      t.text :answers
      t.integer :score

      t.timestamps
    end
  end
end
