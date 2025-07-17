class CreateAnalytics < ActiveRecord::Migration[8.0]
  def change
    create_table :analytics do |t|
      t.integer :home
      t.integer :cv
      t.integer :philosophy
      t.integer :projects
      t.integer :uikit
      t.integer :contact

      t.timestamps
    end
  end
end
