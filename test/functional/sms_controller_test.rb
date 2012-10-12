require 'test_helper'

class SmsControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get send_link" do
    get :send_link
    assert_response :success
  end

  test "should get verify" do
    get :verify
    assert_response :success
  end

end
