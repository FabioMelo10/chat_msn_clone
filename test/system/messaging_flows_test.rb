require "application_system_test_case"

class MessagingFlowsTest < ApplicationSystemTestCase
  def sign_up(name, email)
    visit new_user_registration_path
    fill_in "Name", with: name
    fill_in "Email", with: email
    fill_in "Password", with: "password"
    fill_in "Password confirmation", with: "password"
    click_button "Sign up"
  end

  test "starting a conversation and sending a message" do
    sign_up("User One", "user1@example.com")
    click_on "Logout"
    sign_up("User Two", "user2@example.com")

    click_link "User One"
    fill_in "message_body", with: "Hello"
    click_button "Enviar"

    assert_text "Hello"
  end

  test "real time updates" do
    Capybara.using_session(:user1) do
      sign_up("User One", "user1@example.com")
    end

    Capybara.using_session(:user2) do
      sign_up("User Two", "user2@example.com")
      click_link "User One"
    end

    Capybara.using_session(:user1) do
      click_link "User Two"
    end

    Capybara.using_session(:user2) do
      fill_in "message_body", with: "Oi"
      click_button "Enviar"
      assert_text "Oi"
    end

    Capybara.using_session(:user1) do
      assert_text "Oi"
    end
  end
end
