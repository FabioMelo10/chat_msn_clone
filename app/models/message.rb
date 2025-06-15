class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  after_create_commit :broadcast_message

  private

  def broadcast_message
    broadcast_append_to("messages_#{conversation.id}", partial: "messages/message", locals: { message: self }, target: "messages")
  end
end
