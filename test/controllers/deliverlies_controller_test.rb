require 'test_helper'

class DeliverliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get deliverlies_index_url
    assert_response :success
  end

  test "should get edit" do
    get deliverlies_edit_url
    assert_response :success
  end

  test "should get update" do
    get deliverlies_update_url
    assert_response :success
  end

  test "should get destroy" do
    get deliverlies_destroy_url
    assert_response :success
  end

  test "should get create" do
    get deliverlies_create_url
    assert_response :success
  end

end
