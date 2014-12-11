class CreateProjectImageAttachments < ActiveRecord::Migration
  def change
    create_table :project_image_attachments do |t|
      t.integer :project_id
      t.string :projectimage

      t.timestamps
    end
  end
end
