import consumer from "channels/consumer"

const messagesContainer = document.getElementById("messages")

if (messagesContainer) {
  const conversationId = messagesContainer.dataset.conversationId

  consumer.subscriptions.create({ channel: "MessagesChannel", conversation_id: conversationId }, {
    received(data) {
      messagesContainer.insertAdjacentHTML("beforeend", data)
    }
  })
}
