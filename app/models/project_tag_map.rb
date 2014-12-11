class ProjectTagMap < ActiveRecord::Base
	belongs_to :project_tag
	belongs_to :project
end
