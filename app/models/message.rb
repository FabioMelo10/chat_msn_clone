class Message < ApplicationRecord
  belongs_to :conversation
  belongs_to :user

  attribute :read, :boolean, default: false

  def mark_as_read!
    update(read: true)
  end
end
