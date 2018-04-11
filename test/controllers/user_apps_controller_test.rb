require 'test_helper'

class UserAppsControllerTest < ActionDispatch::IntegrationTest
  test "should get add" do
    get user_apps_add_url
    assert_response :success
  end

  test "should get remove" do
    get user_apps_remove_url
    assert_response :success
  end

  test "should get reorder" do
    get user_apps_reorder_url
    assert_response :success
  end

end
