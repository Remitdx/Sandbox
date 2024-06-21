class CreateMorbacs < ActiveRecord::Migration[7.0]
  def change
    create_table :morbacs do |t|

      t.integer :value, array: true, default: [5, 5, 5, 5, 5, 5, 5, 5, 5]
      t.integer :gameover, default: 2
      t.timestamps
    end
  end
end
