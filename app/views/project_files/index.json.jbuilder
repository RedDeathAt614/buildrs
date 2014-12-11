json.array!(@project_files) do |project_file|
  json.extract! project_file, :id, :description, :file
  json.url project_file_url(project_file, format: :json)
end
