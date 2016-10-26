require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
    test "can see login page and log in with false credentials" do
        @controller = SessionsController.new

        get '/login'
        assert_response :success

        post_via_redirect "/login", username: '', password: ''
        assert_equal '/login', path
        assert_equal 'Wrong username and password!', flash[:error]
    end

    test 'can see the dashboard pate' do
        @controller = SessionsController.new

        get '/login'
        assert_response :success

        post_via_redirect "/login", username: 'AndreiHurjui', password: 'secretpass'
        assert_equal '/login', path
        assert_equal 'Wrong username and password!', flash[:error]
    end
end

