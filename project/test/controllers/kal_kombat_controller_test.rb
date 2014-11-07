require 'test_helper'

class KalKombatControllerTest < ActionController::TestCase
  test "should get KalKombat" do
    get :KalKombat
    assert_response :success
  end

end
