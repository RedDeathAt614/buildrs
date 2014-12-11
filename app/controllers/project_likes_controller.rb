class ProjectLikesController < ApplicationController

  # GET project/:id/project_likes/new
  def new
    puts "PROJECTLIKE NEW"
    puts current_user.id
    @project = Project.find(params[:project_id])
    @project.likeProject(current_user.id)
    redirect_to @project
  end

  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_like_params
      params.require(:project_like).permit(:project_id, :user_id)
    end
end
