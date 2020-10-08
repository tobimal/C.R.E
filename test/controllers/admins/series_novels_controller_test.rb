require 'test_helper'

class Admins::SeriesNovelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_series_novels_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_series_novels_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_series_novels_edit_url
    assert_response :success
  end

end
