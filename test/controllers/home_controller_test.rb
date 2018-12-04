require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get about" do
    get home_about_url
    assert_response :success
  end

  test "should get contact_us" do
    get home_contact_us_url
    assert_response :success
  end

  test "should get prices" do
    get home_prices_url
    assert_response :success
  end

end
