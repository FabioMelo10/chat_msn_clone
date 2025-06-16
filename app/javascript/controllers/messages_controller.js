import { Controller } from "@hotwired/stimulus"
import { createConsumer } from "@rails/actioncable"

export default class extends Controller {
  static values = { conversationId: Number }

  connect() {
    this.channel = createConsumer().subscriptions.create(
      { channel: "MessagesChannel", conversation_id: this.conversationIdValue },
      { received: (data) => this.element.insertAdjacentHTML("beforeend", data) }
    )
  }

  disconnect() {
    if (this.channel) {
      this.channel.unsubscribe()
    }
  }
}
