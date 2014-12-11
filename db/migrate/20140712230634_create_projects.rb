class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.string :description
      t.integer :user_id
      t.integer :likes
      t.integer :views

      t.timestamps
    end
  end
end
