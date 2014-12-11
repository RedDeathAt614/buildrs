class ProjectImageAttachmentsController < ApplicationController
  before_action :set_project_image_attachment, only: [:show, :edit, :update, :destroy]

  # GET /project_image_attachments
  # GET /project_image_attachments.json
  def index
    @project_image_attachments = ProjectImageAttachment.all
  end

  # GET /project_image_attachments/1
  # GET /project_image_attachments/1.json
  def show
  end

  # GET /project_image_attachments/new
  def new
    @project_image_attachment = ProjectImageAttachment.new
  end

  # GET /project_image_attachments/1/edit
  def edit
  end

  # POST /project_image_attachments
  # POST /project_image_attachments.json
  def create
    @project_image_attachment = ProjectImageAttachment.new(project_image_attachment_params)

    respond_to do |format|
      if @project_image_attachment.save
        format.html { redirect_to @project_image_attachment, notice: 'Project image attachment was successfully created.' }
        format.json { render :show, status: :created, location: @project_image_attachment }
      else
        format.html { render :new }
        format.json { render json: @project_image_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /project_image_attachments/1
  # PATCH/PUT /project_image_attachments/1.json
  def update
    respond_to do |format|
      if @project_image_attachment.update(project_image_attachment_params)
        format.html { redirect_to @project_image_attachment, notice: 'Project image attachment was successfully updated.' }
        format.json { render :show, status: :ok, location: @project_image_attachment }
      else
        format.html { render :edit }
        format.json { render json: @project_image_attachment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_image_attachments/1
  # DELETE /project_image_attachments/1.json
  def destroy
    @project_image_attachment.destroy
    respond_to do |format|
      format.html { redirect_to project_image_attachments_url, notice: 'Project image attachment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project_image_attachment
      @project_image_attachment = ProjectImageAttachment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def project_image_attachment_params
      params.require(:project_image_attachment).permit(:project_id, :projectimage)
    end
end
