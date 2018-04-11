require 'test_helper'

class HomepageControllerTest < ActionDispatch::IntegrationTest
  test "should get show_home" do
    get homepage_show_home_url
    assert_response :success
  end

end
