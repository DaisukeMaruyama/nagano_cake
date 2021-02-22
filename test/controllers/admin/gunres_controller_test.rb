require 'test_helper'

class Admin::GunresControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_gunres_index_url
    assert_response :success
  end

  test "should get create" do
    get admin_gunres_create_url
    assert_response :success
  end

  test "should get edit" do
    get admin_gunres_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_gunres_update_url
    assert_response :success
  end

end
