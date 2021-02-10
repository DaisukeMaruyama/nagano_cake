require 'test_helper'

class Admin::CutomersControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_cutomers_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_cutomers_show_url
    assert_response :success
  end

  test "should get edit" do
    get admin_cutomers_edit_url
    assert_response :success
  end

  test "should get update" do
    get admin_cutomers_update_url
    assert_response :success
  end

end
