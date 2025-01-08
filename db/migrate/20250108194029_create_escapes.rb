class CreateEscapes < ActiveRecord::Migration[8.0]
  def change
    create_table :escapes do |t|
      t.integer :gameover
      t.integer :result

      t.timestamps
    end
  end
end
