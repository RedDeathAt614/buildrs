class ProjectImageAttachment < ActiveRecord::Base
	mount_uploader :projectimage, ProjectImageUploader
	belongs_to :project
end
