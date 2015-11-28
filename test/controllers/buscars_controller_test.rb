require 'test_helper'

class BuscarsControllerTest < ActionController::TestCase
  setup do
    @buscar = buscars(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:buscars)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create buscar" do
    assert_difference('Buscar.count') do
      post :create, buscar: {  }
    end

    assert_redirected_to buscar_path(assigns(:buscar))
  end

  test "should show buscar" do
    get :show, id: @buscar
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @buscar
    assert_response :success
  end

  test "should update buscar" do
    patch :update, id: @buscar, buscar: {  }
    assert_redirected_to buscar_path(assigns(:buscar))
  end

  test "should destroy buscar" do
    assert_difference('Buscar.count', -1) do
      delete :destroy, id: @buscar
    end

    assert_redirected_to buscars_path
  end
end
