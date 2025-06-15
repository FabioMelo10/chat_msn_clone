require "application_system_test_case"

class UserFlowsTest < ApplicationSystemTestCase
  test "user registration and login" do
    visit root_path
    click_on "Cadastro"

    fill_in "Name", with: "User One"
    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"

    assert_text "Logout"

    click_on "Logout"
    click_on "Login"

    fill_in "Email", with: "user1@example.com"
    fill_in "Password", with: "password"
    click_button "Log in"

    assert_text "Logout"
  end
end
