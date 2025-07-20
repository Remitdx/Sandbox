class AddErrorsIntoAnalytic < ActiveRecord::Migration[8.0]
  def change
    add_column :analytics, :errors_internal_server_error, :integer
    add_column :analytics, :errors_not_found, :integer
    add_column :analytics, :errors_unprocessable_entity, :integer
  end
end
