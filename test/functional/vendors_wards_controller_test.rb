require 'test_helper'

class VendorsWardsControllerTest < ActionController::TestCase
  setup do
    @vendors_ward = vendors_wards(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vendors_wards)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vendors_ward" do
    assert_difference('VendorsWard.count') do
      post :create, vendors_ward: { numberOfOrders: @vendors_ward.numberOfOrders, vendor_id: @vendors_ward.vendor_id, ward: @vendors_ward.ward }
    end

    assert_redirected_to vendors_ward_path(assigns(:vendors_ward))
  end

  test "should show vendors_ward" do
    get :show, id: @vendors_ward
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vendors_ward
    assert_response :success
  end

  test "should update vendors_ward" do
    put :update, id: @vendors_ward, vendors_ward: { numberOfOrders: @vendors_ward.numberOfOrders, vendor_id: @vendors_ward.vendor_id, ward: @vendors_ward.ward }
    assert_redirected_to vendors_ward_path(assigns(:vendors_ward))
  end

  test "should destroy vendors_ward" do
    assert_difference('VendorsWard.count', -1) do
      delete :destroy, id: @vendors_ward
    end

    assert_redirected_to vendors_wards_path
  end
end
