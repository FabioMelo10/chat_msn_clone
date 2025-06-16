require "test_helper"

class UserTest < ActiveSupport::TestCase
  test "name must be present" do
    user = User.new(email: "name@example.com", password: "password", password_confirmation: "password")
    assert_not user.valid?
    assert_includes user.errors[:name], "can't be blank"

    user.name = "Example"
    assert user.valid?
  end
end
