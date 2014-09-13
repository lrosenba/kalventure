require 'test_helper'

class LoginControllerTest < ActionController::TestCase
  test "should get index" do
    get :loginPage
    assert_response :success
  end

end
