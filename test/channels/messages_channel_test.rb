require "test_helper"

class MessagesChannelTest < ActionCable::Channel::TestCase
  include ActionCable::TestHelper

  test "broadcasts HTML when a message is created" do
    sender = User.create!(email: "sender@example.com", password: "password", name: "Sender")
    recipient = User.create!(email: "recipient@example.com", password: "password", name: "Recipient")
    conversation = Conversation.create!(sender: sender, recipient: recipient)

    message = Message.new(conversation: conversation, user: sender, body: "Hello")
    expected_html = ApplicationController.renderer.render(
      partial: "messages/message",
      locals: { message: message }
    )

    assert_broadcast_on("messages_#{conversation.id}", expected_html) do
      message.save!
    end
  end
end
