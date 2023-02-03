require "test_helper"

class ScheduleOfActivitiesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get schedule_of_activities_index_url
    assert_response :success
  end
end
