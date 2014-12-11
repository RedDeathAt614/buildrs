class ProjectsController < ApplicationController
  before_action :set_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index]

  # GET /projects
  # GET /projects.json
  def index
    puts "INDEX!"
    @projects = Project.all
    @user = current_user
  end

  # GET /projects/1
  # GET /projects/1.json
  def show
    puts "SHOW"
    
    @projects = Project.find(params[:id])
    @project_image_attachments = @projects.project_image_attachments.all
    @project_files = @projects.project_files.all
    @project_views = @projects.viewProject(current_user.id)
    @project_comments = @project.project_comments
    @project_comment = ProjectComment.new
    @project_tags = @projects.project_tags
    
    @user = current_user
    @project_user = @projects.user
    scores = @project_user.projects_scores
    @project_user_likes = scores[0]
    @project_user_views = scores[1]
    @project_user_score = scores[2]
  end

  # GET /projects/new
  def new
    puts "NEW"
    @project = Project.new
    @project_image_attachments = @project.project_image_attachments.build
    @project_files = @project.project_files.build
  end

  # GET /projects/1/edit
  def edit
    puts "EDIT!"
  end

  # POST /projects
  # POST /projects.json
  def create
    puts "CREATE!"
    p = project_params
    # adding user_id
    p["user_id"] = current_user.id
    puts p
    puts "-----"

    @project = Project.new(p)

    respond_to do |format|
      if @project.save
        params[:project_image_attachments]['projectimage'].each do |a|
            @project_image_attachments = @project.project_image_attachments.create!(:projectimage => a, :project_id => @project.id)
        end
        # This is stupid. For some reason it creates the project files but without the files. No clue why it doesn't do it with Project image attachment...
        desc = @project.project_files.first.description
        # Stupid: Now destroy the project file just created. Also potential race-condition if multiple authors tries to edit the same project files at the same time
        @project.project_files.last.destroy
        pf = @project.project_files
        params[:project_files]['projectfile'].each do |a,index|
            @project_files = @project.project_files.create!(:file => a, :project_id => @project.id, :description => desc)
        end
        format.html { redirect_to @project, notice: 'Project was successfully created.' }
        format.json { render :show, status: :created, location: @project }
      else
        format.html { render :new }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /projects/1
  # PATCH/PUT /projects/1.json
  def update
    puts "UPDATE!"
    respond_to do |format|
      if @project.update(project_params)
        format.html { redirect_to @project, notice: 'Project was successfully updated.' }
        format.json { render :show, status: :ok, location: @project }
      else
        format.html { render :edit }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    puts "DESTROY"
    if current_user.id = @project.user_id
      @project.destroy
      respond_to do |format|
        format.html { redirect_to projects_url, notice: 'Project was successfully destroyed.' }
        format.json { head :no_content }
      end
    else
      respond_to do |format|
        format.html { redirect_to projects_url, alert: "You can't destroy that." }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      puts "SET_PROJECT!"
      @project = Project.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      puts "PROJECT_PARAMS!"
      #params.require(:project).permit(:title, :description, :user_id, :likes, :views)
      params.require(:project).permit(:title, :description, :license, project_image_attachments_attributes: [:id, :project_id, :projectimage], project_files_attributes: [:id, :project_id, :projectfile, :description])
    end
end
