require 'test_helper'

class ServiceControllerTest < ActionController::TestCase
  test "should get sms" do
    get :sms
    assert_response :success
  end

  test "should get phone" do
    get :phone
    assert_response :success
  end

end
