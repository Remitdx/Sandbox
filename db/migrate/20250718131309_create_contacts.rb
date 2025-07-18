class CreateContacts < ActiveRecord::Migration[8.0]
  def change
    create_table :contacts do |t|
      t.string :name
      t.string :surname
      t.string :company
      t.string :job
      t.text :message

      t.timestamps
    end
  end
end
