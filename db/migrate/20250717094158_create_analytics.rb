class CreateAnalytics < ActiveRecord::Migration[8.0]
  def change
    create_table :analytics do |t|
      t.integer :pages_home
      t.integer :pages_cv
      t.integer :pages_philosophy
      t.integer :pages_projects
      t.integer :pages_uikit
      t.integer :pages_legal
      t.integer :contacts_index
      t.integer :tournaments_index
      t.integer :tournaments_create
      t.integer :rolls_create
      t.integer :puzzles_index
      t.integer :puzzles_create
      t.integer :morbacs_create
      t.integer :puissance4s_create
      t.integer :escapes_create
      t.integer :dikkeneks_index
      t.integer :dikkeneks_create
      t.timestamps
    end
  end
end
