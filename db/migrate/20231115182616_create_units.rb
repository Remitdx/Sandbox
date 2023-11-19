class CreateUnits < ActiveRecord::Migration[7.0]
  def change
    create_table :units do |t|
      t.integer :attack
      t.integer :health
      t.integer :crit
      t.integer :moral

      t.timestamps
    end
  end
end
