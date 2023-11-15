class CreateDices < ActiveRecord::Migration[7.0]
  def change
    create_table :dices do |t|
      t.integer :value
      t.integer :faces
      t.boolean :locked
      t.string :color

      t.timestamps
    end
  end
end
