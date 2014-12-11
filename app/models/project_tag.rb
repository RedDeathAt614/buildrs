class ProjectTag < ActiveRecord::Base
	has_many :project_tag_maps
	has_many :projects, :through => :project_tag_maps
end
