require 'test_helper'

class DashboardControllerTest < ActionController::TestCase
    test "can see the redirect to login page" do
        get "index"
        assert_response :redirect
    end
end
