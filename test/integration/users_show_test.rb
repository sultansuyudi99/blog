require "test_helper"

class UsersShowTest < ActionDispatch::IntegrationTest
  def setup
    @admin = users(:one)
    @non_admin = users(:two)
  end

  test "should show delete button if admin" do
    log_in_as(@admin)
    get user_path(@non_admin)
    assert_select "form[action=?]", user_path(@non_admin)
  end

  test "should not show delete button if admin" do
    log_in_as(@non_admin)
    get user_path(@admin)
    assert_select "form[action=?]", user_path, count: 0
  end
end
