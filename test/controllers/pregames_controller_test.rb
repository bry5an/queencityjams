require 'test_helper'

class PregamesControllerTest < ActionController::TestCase
  setup do
    @pregame = pregames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:pregames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create pregame" do
    assert_difference('Pregame.count') do
      post :create, pregame: {  }
    end

    assert_redirected_to pregame_path(assigns(:pregame))
  end

  test "should show pregame" do
    get :show, id: @pregame
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @pregame
    assert_response :success
  end

  test "should update pregame" do
    patch :update, id: @pregame, pregame: {  }
    assert_redirected_to pregame_path(assigns(:pregame))
  end

  test "should destroy pregame" do
    assert_difference('Pregame.count', -1) do
      delete :destroy, id: @pregame
    end

    assert_redirected_to pregames_path
  end
end
