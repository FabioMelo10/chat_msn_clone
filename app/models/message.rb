class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  validates :body, presence: true

  attribute :read, :boolean, default: false

  after_create_commit :broadcast_message

  def mark_as_read!
    update(read: true)
  end

  private

  def broadcast_message
    message_html = ApplicationController.renderer.render(
      partial: 'messages/message',
      locals: { message: self }
    )
    ActionCable.server.broadcast("messages_#{conversation.id}", message_html)
  end
end
