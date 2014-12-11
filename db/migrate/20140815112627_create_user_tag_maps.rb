class CreateUserTagMaps < ActiveRecord::Migration
  def change
    create_table :user_tag_maps do |t|
      t.integer :user_tag_id
      t.integer :user_id

      t.timestamps
    end
  end
end
