require 'test_helper'

class Publics::FavoriteControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get publics_favorite_show_url
    assert_response :success
  end

end
