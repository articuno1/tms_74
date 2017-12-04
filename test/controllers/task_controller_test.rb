require "test_helper"

class TaskControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get task_home_url
    assert_response :success
  end
end
