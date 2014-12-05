require 'test_helper'

class InvestesControllerTest < ActionController::TestCase
  setup do
    @investe = investes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:investes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create investe" do
    assert_difference('Investe.count') do
      post :create, investe: { Company: @investe.Company, Description: @investe.Description, Opportunity_Headline: @investe.Opportunity_Headline }
    end

    assert_redirected_to investe_path(assigns(:investe))
  end

  test "should show investe" do
    get :show, id: @investe
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @investe
    assert_response :success
  end

  test "should update investe" do
    patch :update, id: @investe, investe: { Company: @investe.Company, Description: @investe.Description, Opportunity_Headline: @investe.Opportunity_Headline }
    assert_redirected_to investe_path(assigns(:investe))
  end

  test "should destroy investe" do
    assert_difference('Investe.count', -1) do
      delete :destroy, id: @investe
    end

    assert_redirected_to investes_path
  end
end
