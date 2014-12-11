json.array!(@project_image_attachments) do |project_image_attachment|
  json.extract! project_image_attachment, :id, :project_id, :projectimage
  json.url project_image_attachment_url(project_image_attachment, format: :json)
end
