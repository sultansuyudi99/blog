# typed: true

require "test_helper"

class UsersSignupTest < ActionDispatch::IntegrationTest
  test "invalid signup information" do
    assert_no_difference "User.count" do
      post users_path, params: {
        user: {
          name: "",
          email: "user@invalid",
          password: "foo",
          password_confirmation: "bar"
        }
      }
    end
  end

  test "signup and show user page" do
    assert_difference "User.count", 1 do
      post users_path, params: {
        user: {
          name: "user123",
          email: "user123987@gmail.com",
          password: "admin#1234",
          password_confirmation: "admin#1234"
        }
      }
    end

    follow_redirect!
    assert_template "users/show"

  end
end
