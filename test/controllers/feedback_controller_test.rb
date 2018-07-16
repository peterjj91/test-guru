require 'test_helper'

class FeedbackControllerTest < ActionDispatch::IntegrationTest

  test "should get send" do
    get feedback_send_url
    assert_response :success
  end
  
end