require 'test_helper'

class MinigamesControllerTest < ActionController::TestCase
  test "should get desktop" do
    get :desktop
    assert_response :success
  end

end
