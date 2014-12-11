class CreateProjectTagMaps < ActiveRecord::Migration
  def change
    create_table :project_tag_maps do |t|
      t.integer :project_tag_id
      t.integer :project_id

      t.timestamps
    end
  end
end
