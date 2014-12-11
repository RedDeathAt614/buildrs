class CreateProjectFiles < ActiveRecord::Migration
  def change
    create_table :project_files do |t|
      t.string :description
      t.string :file

      t.timestamps
    end
  end
end
