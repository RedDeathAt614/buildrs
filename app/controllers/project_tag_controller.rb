class ProjectTagController < ApplicationController
  def create
  	puts "PROJECTTAG CREATE"
  	content = params[:project_tag][:content]

  	if (content != "")
  		content.downcase!
  		existing = ProjectTag.where("content = :d",{d: content})
  		u = nil
  		if (existing.length == 0)
  			u = ProjectTag.create(:content => content)
  		else
  			u = existing.first
  		end
  		project_tags = Project.find(params[:project_id]).project_tags.where("content = :d",{d: content})
  		if (project_tags.length == 0)
  			ProjectTagMap.create(:project_tag_id => u.id, :project_id => params[:project_id])
  		end
  	end
  	redirect_to project_path(params[:project_id])
  end
end
