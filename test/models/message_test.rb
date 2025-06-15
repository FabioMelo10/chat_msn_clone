require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "body must be present" do
    sender = User.create!(email: "sender@example.com", password: "password", password_confirmation: "password", name: "Sender")
    recipient = User.create!(email: "recipient@example.com", password: "password", password_confirmation: "password", name: "Recipient")
    conversation = Conversation.create!(sender: sender, recipient: recipient)

    message = Message.new(conversation: conversation, user: sender)
    assert_not message.valid?
    assert_includes message.errors[:body], "can't be blank"

    message.body = "hello"
    assert message.valid?
  end
end
