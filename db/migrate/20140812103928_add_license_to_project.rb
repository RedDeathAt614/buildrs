class AddLicenseToProject < ActiveRecord::Migration
  def change
    add_column :projects, :license, :string
  end
end
