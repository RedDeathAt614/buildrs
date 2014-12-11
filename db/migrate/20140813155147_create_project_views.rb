class CreateProjectViews < ActiveRecord::Migration
  def change
    create_table :project_views do |t|
      t.integer :project_id
      t.integer :user_id

      t.timestamps
    end
  end
end
