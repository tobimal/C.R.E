require 'test_helper'

class Publics::SeriesNovelsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_series_novels_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_series_novels_show_url
    assert_response :success
  end

  test "should get new" do
    get publics_series_novels_new_url
    assert_response :success
  end

  test "should get edit" do
    get publics_series_novels_edit_url
    assert_response :success
  end

end
