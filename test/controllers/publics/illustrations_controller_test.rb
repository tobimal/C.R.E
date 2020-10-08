require 'test_helper'

class Publics::IllustrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get publics_illustrations_index_url
    assert_response :success
  end

  test "should get show" do
    get publics_illustrations_show_url
    assert_response :success
  end

  test "should get new" do
    get publics_illustrations_new_url
    assert_response :success
  end

  test "should get edit" do
    get publics_illustrations_edit_url
    assert_response :success
  end

end
