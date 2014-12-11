require 'test_helper'

class ProjectLikesControllerTest < ActionController::TestCase
  setup do
    @project_like = project_likes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:project_likes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project_like" do
    assert_difference('ProjectLike.count') do
      post :create, project_like: { project_id: @project_like.project_id, user_id: @project_like.user_id }
    end

    assert_redirected_to project_like_path(assigns(:project_like))
  end

  test "should show project_like" do
    get :show, id: @project_like
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project_like
    assert_response :success
  end

  test "should update project_like" do
    patch :update, id: @project_like, project_like: { project_id: @project_like.project_id, user_id: @project_like.user_id }
    assert_redirected_to project_like_path(assigns(:project_like))
  end

  test "should destroy project_like" do
    assert_difference('ProjectLike.count', -1) do
      delete :destroy, id: @project_like
    end

    assert_redirected_to project_likes_path
  end
end
