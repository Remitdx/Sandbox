class CreatePlayers < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.string :pseudo
      t.belongs_to :risk, index: true

      t.timestamps
    end
  end
end
