require 'test_helper'

class Admins::IllustrationsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admins_illustrations_index_url
    assert_response :success
  end

  test "should get show" do
    get admins_illustrations_show_url
    assert_response :success
  end

  test "should get edit" do
    get admins_illustrations_edit_url
    assert_response :success
  end

end
