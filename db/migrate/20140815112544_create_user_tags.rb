class CreateUserTags < ActiveRecord::Migration
  def change
    create_table :user_tags do |t|
      t.string :content

      t.timestamps
    end
  end
end
