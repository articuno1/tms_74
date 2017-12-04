require "test_helper"

class CourseControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get course_home_url
    assert_response :success
  end
end
