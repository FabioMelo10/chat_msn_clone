require "test_helper"

class MessageTest < ActiveSupport::TestCase
  test "new messages are unread by default" do
    conversation = conversations(:one)
    user = users(:one)
    message = Message.new(conversation: conversation, user: user, body: "Hello")
    assert_not message.read
    message.save!
    assert_not message.reload.read
  end

  test "mark_as_read! updates read flag" do
    message = messages(:one)
    assert_not message.read
    message.mark_as_read!
    assert message.reload.read
  end
end
