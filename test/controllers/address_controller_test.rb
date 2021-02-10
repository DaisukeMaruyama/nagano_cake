require 'test_helper'

class AddressControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get address_index_url
    assert_response :success
  end

  test "should get edit" do
    get address_edit_url
    assert_response :success
  end

end
