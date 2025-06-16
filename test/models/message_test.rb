require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "body must be present" do
    sender = User.create!(email: "sender@example.com", password: "password", name: "Sender")
    recipient = User.create!(email: "recipient@example.com", password: "password", name: "Recipient")
    conversation = Conversation.create!(sender: sender, recipient: recipient)

    message = Message.new(conversation: conversation, user: sender)
    assert_not message.valid?
    assert_includes message.errors[:body], "can't be blank"

    message.body = "Hello"
    assert message.valid?
  end

  test "new messages are unread by default" do
    conversation = conversations(:one)
    user = users(:one)
    message = Message.new(conversation: conversation, user: user, body: "Hello")
    assert_not message.read
    message.save!
    assert_not message.reload.read
  end

  test "mark_as_read! updates read flag" do
    conversation = conversations(:one)
    user = users(:one)
    message = Message.create!(conversation: conversation, user: user, body: "Hello")

    assert_not message.read
    message.mark_as_read!
    assert message.reload.read
  end
end
