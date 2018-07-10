require 'test_helper'

class BrandlistsControllerTest < ActionController::TestCase
  setup do
    @brandlist = brandlists(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:brandlists)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create brandlist" do
    assert_difference('Brandlist.count') do
      post :create, brandlist: { Price: @brandlist.Price, brandName: @brandlist.brandName, quantity: @brandlist.quantity }
    end

    assert_redirected_to brandlist_path(assigns(:brandlist))
  end

  test "should show brandlist" do
    get :show, id: @brandlist
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @brandlist
    assert_response :success
  end

  test "should update brandlist" do
    put :update, id: @brandlist, brandlist: { Price: @brandlist.Price, brandName: @brandlist.brandName, quantity: @brandlist.quantity }
    assert_redirected_to brandlist_path(assigns(:brandlist))
  end

  test "should destroy brandlist" do
    assert_difference('Brandlist.count', -1) do
      delete :destroy, id: @brandlist
    end

    assert_redirected_to brandlists_path
  end
end
