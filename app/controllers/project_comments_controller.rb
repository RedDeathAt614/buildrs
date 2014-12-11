class ProjectCommentsController < ApplicationController
  before_action :set_project
  before_action :set_project_comment, only: [:show, :edit, :update, :destroy]

  # GET /project_comments
  # GET /project_comments.json
  def index
    @project_comments = ProjectComment.all
  end

  # GET /project_comments/1
  # GET /project_comments/1.json
  def show
  end

  # GET /project_comments/new
  def new
    @project_comment = @project.project_comments.build#ProjectComment.new
  end

  # GET /project_comments/1/edit
  def edit
  end

  # POST /project_comments
  # POST /project_comments.json
  def create
    puts "COMMENT CREATE"
    puts params
    puts "_---"
    puts project_comment_params

    if !@project.commentedProject?(current_user.id)
      @project_comment = @project.project_comments.build(project_comment_params)#ProjectComment.new(project_comment_params)

      respond_to do |format|
        if @project_comment.save
          @project_comment.update(:user_id => current_user.id) # This is stupid, but right now I don't have a better solution for it
          format.html { redirect_to @project }
          #format.json { render :show, status: :created, location: @project }
        else
          format.html { render :new }
          format.json { render json: @project_comment.errors, status: :unprocessable_entity }
        end
      end
      @project.updateScore
    end
  end

  # PATCH/PUT /project_comments/1
  # PATCH/PUT /project_comments/1.json
  def update
    respond_to do |format|
      if @project_comment.update(project_comment_params)
        format.html { redirect_to @project_comment, notice: 'Project comment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_comment }
      else
        format.html { render :edit }
        format.json { render json: @project_comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_comments/1
  # DELETE /project_comments/1.json
  def destroy
    @project_comment.destroy
    respond_to do |format|
      format.html { redirect_to project_comments_url, notice: 'Project comment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_project
      @project = Project.find(params[:project_id])
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_project_comment
      @project_comment = @project.project_comments.find(params[:id])#ProjectComment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_comment_params
      params.require(:project_comment).permit(:project_id, :user_id, :comment, :score)
    end
end
