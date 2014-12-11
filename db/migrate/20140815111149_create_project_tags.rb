class CreateProjectTags < ActiveRecord::Migration
  def change
    create_table :project_tags do |t|
      t.string :content

      t.timestamps
    end
  end
end
