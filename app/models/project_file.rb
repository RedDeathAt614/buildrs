class ProjectFile < ActiveRecord::Base
  mount_uploader :file, ProjectFileUploader
  belongs_to :project
end
