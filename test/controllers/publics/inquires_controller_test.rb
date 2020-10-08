require 'test_helper'

class Publics::InquiresControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get publics_inquires_new_url
    assert_response :success
  end

end
