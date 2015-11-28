require 'test_helper'

class SoatPrivatesControllerTest < ActionController::TestCase
  setup do
    @soat_private = soat_privates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:soat_privates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create soat_private" do
    assert_difference('SoatPrivate.count') do
      post :create, soat_private: { clase: @soat_private.clase, contribucion: @soat_private.contribucion, prima: @soat_private.prima, tasa: @soat_private.tasa, vehiculo: @soat_private.vehiculo }
    end

    assert_redirected_to soat_private_path(assigns(:soat_private))
  end

  test "should show soat_private" do
    get :show, id: @soat_private
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @soat_private
    assert_response :success
  end

  test "should update soat_private" do
    patch :update, id: @soat_private, soat_private: { clase: @soat_private.clase, contribucion: @soat_private.contribucion, prima: @soat_private.prima, tasa: @soat_private.tasa, vehiculo: @soat_private.vehiculo }
    assert_redirected_to soat_private_path(assigns(:soat_private))
  end

  test "should destroy soat_private" do
    assert_difference('SoatPrivate.count', -1) do
      delete :destroy, id: @soat_private
    end

    assert_redirected_to soat_privates_path
  end
end
