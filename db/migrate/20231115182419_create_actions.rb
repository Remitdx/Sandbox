class CreateActions < ActiveRecord::Migration[7.0]
  def change
    create_table :actions do |t|
      t.string :type
      t.belongs_to :unit, index: true
      t.belongs_to :tile, index: true

      t.timestamps
    end
  end
end
