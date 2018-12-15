require 'test_helper'

class UserFlowsTest < ActionDispatch::IntegrationTest
    test "login and browse" do
        get '/users/sign_in'
        post '/users/sign_in', params: {user: { email: users(:juan).email, password: 'andres1234' } }
        follow_redirect! #para probar qe la redirección hace un assert
        assert_equal '/', path
        assert_equal 'Signed in successfully.', flash[:notice]
    end

end