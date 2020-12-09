require 'test_helper'

class PayControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get pay_new_url
    assert_response :success
  end

  test "should get create" do
    get pay_create_url
    assert_response :success
  end

end
