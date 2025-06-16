class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  attribute :read, :boolean, default: false

  after_create_commit :broadcast_message

  def mark_as_read!
    update(read: true)
  end

  private

  def broadcast_message
    message_html = ApplicationController.render(
      partial: 'messages/message',
      locals: { message: self }
    )
    ActionCable.server.broadcast("messages_#{conversation_id}", message_html)
  end
end
