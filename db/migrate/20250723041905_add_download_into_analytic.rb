class AddDownloadIntoAnalytic < ActiveRecord::Migration[8.0]
  def change
    add_column :analytics, :pages_download_pdf, :integer
  end
end
