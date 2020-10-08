require 'test_helper'

class Admins::SeriesIllustsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_series_illusts_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_series_illusts_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_series_illusts_edit_url
    assert_response :success
  end

end
