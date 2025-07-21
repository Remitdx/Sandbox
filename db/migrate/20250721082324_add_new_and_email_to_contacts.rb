class AddNewAndEmailToContacts < ActiveRecord::Migration[8.0]
  def change
    add_column :contacts, :new, :boolean
    add_column :contacts, :email, :string

  end
end
