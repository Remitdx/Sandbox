class CreateRisks < ActiveRecord::Migration[7.0]
  def change
    create_table :risks do |t|
      t.integer :mode
      t.integer :complexity

      t.timestamps
    end
  end
end
