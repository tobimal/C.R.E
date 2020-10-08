require 'test_helper'

class Publics::SeriesIllustsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_series_illusts_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_series_illusts_show_url
    assert_response :success
  end

  test "should get edit" do
    get publics_series_illusts_edit_url
    assert_response :success
  end

end
