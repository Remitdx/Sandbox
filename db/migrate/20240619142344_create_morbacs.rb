class CreateMorbacs < ActiveRecord::Migration[7.0]
  def change
    create_table :morbacs do |t|

      t.string :value, array: true, default: [2, 2, 2, 2, 2, 2, 2, 2, 2]
      t.timestamps
    end
  end
end
