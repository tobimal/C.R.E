require 'test_helper'

class Publics::HistoryControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_history_show_url
    assert_response :success
  end

end
