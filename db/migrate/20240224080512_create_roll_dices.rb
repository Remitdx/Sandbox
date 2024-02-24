class CreateRollDices < ActiveRecord::Migration[7.0]
  def change
    create_table :roll_dices do |t|
      t.integer :value
      t.integer :faces
      t.string :color
      t.belongs_to :roll, index: true

      t.timestamps
    end
  end
end
