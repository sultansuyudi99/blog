require "test_helper"

class StaticPagesControllerTest < ActionDispatch::IntegrationTest
  base_title = " | Ruby on Rails Blog"

  def setup
    @user = users(:one)
  end

  test "should get root" do
    get root_url
    assert_response :success
    assert_select "title", "Home" + base_title
  end

  test "should get help" do
    get help_url
    assert_response :success
    assert_select "title", "Help" + base_title
  end

  test "should get about" do
    get about_url
    assert_response :success
    assert_select "title", "About" + base_title
  end

  test "should have links to about and help when not logged in" do
    get root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
  end

  test "should have links to about, help, and users when logged in" do
    log_in_as(@user)
    get root_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", help_path
    assert_select "a[href=?]", users_path
  end
end
