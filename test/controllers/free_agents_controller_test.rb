require 'test_helper'

class FreeAgentsControllerTest < ActionController::TestCase
  setup do
    @free_agent = free_agents(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:free_agents)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create free_agent" do
    assert_difference('FreeAgent.count') do
      post :create, free_agent: { Details: @free_agent.Details, Headline: @free_agent.Headline }
    end

    assert_redirected_to free_agent_path(assigns(:free_agent))
  end

  test "should show free_agent" do
    get :show, id: @free_agent
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @free_agent
    assert_response :success
  end

  test "should update free_agent" do
    patch :update, id: @free_agent, free_agent: { Details: @free_agent.Details, Headline: @free_agent.Headline }
    assert_redirected_to free_agent_path(assigns(:free_agent))
  end

  test "should destroy free_agent" do
    assert_difference('FreeAgent.count', -1) do
      delete :destroy, id: @free_agent
    end

    assert_redirected_to free_agents_path
  end
end
