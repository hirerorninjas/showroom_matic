require 'test_helper'

class JobPostersControllerTest < ActionController::TestCase
  setup do
    @job_poster = job_posters(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:job_posters)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create job_poster" do
    assert_difference('JobPoster.count') do
      post :create, job_poster: { Details: @job_poster.Details, Headline: @job_poster.Headline }
    end

    assert_redirected_to job_poster_path(assigns(:job_poster))
  end

  test "should show job_poster" do
    get :show, id: @job_poster
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @job_poster
    assert_response :success
  end

  test "should update job_poster" do
    patch :update, id: @job_poster, job_poster: { Details: @job_poster.Details, Headline: @job_poster.Headline }
    assert_redirected_to job_poster_path(assigns(:job_poster))
  end

  test "should destroy job_poster" do
    assert_difference('JobPoster.count', -1) do
      delete :destroy, id: @job_poster
    end

    assert_redirected_to job_posters_path
  end
end
