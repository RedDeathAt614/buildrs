require 'test_helper'

class ProjectImageAttachmentsControllerTest < ActionController::TestCase
  setup do
    @project_image_attachment = project_image_attachments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_image_attachments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_image_attachment" do
    assert_difference('ProjectImageAttachment.count') do
      post :create, project_image_attachment: { project_id: @project_image_attachment.project_id, projectimage: @project_image_attachment.projectimage }
    end

    assert_redirected_to project_image_attachment_path(assigns(:project_image_attachment))
  end

  test "should show project_image_attachment" do
    get :show, id: @project_image_attachment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_image_attachment
    assert_response :success
  end

  test "should update project_image_attachment" do
    patch :update, id: @project_image_attachment, project_image_attachment: { project_id: @project_image_attachment.project_id, projectimage: @project_image_attachment.projectimage }
    assert_redirected_to project_image_attachment_path(assigns(:project_image_attachment))
  end

  test "should destroy project_image_attachment" do
    assert_difference('ProjectImageAttachment.count', -1) do
      delete :destroy, id: @project_image_attachment
    end

    assert_redirected_to project_image_attachments_path
  end
end
