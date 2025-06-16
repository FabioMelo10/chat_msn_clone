require "test_helper"

class MessagesControllerTest < ActionDispatch::IntegrationTest
  test "creates message associated with conversation" do
    user = User.create!(email: "user1@example.com", password: "password")
    recipient = User.create!(email: "user2@example.com", password: "password")
    conversation = Conversation.create!(sender: user, recipient: recipient)

    sign_in user

    assert_difference("Message.count", 1) do
      post conversation_messages_path(conversation), params: { message: { body: "Hello" } }
    end

    message = Message.order(:created_at).last
    assert_equal conversation, message.conversation
    assert_equal user, message.user
    assert_redirected_to conversation_path(conversation)
  end
end
