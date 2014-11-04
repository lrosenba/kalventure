require 'test_helper'

class FightingGame1ControllerTest < ActionController::TestCase
  test "should get KalKombat" do
    get :KalKombat
    assert_response :success
  end

end
