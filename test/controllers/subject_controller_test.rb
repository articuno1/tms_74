require "test_helper"

class SubjectControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get subject_home_url
    assert_response :success
  end
end
