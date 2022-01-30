import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    var messageDiv = document.createElement('div')
    messageDiv.innerHTML = `<strong>${data.user_name}:</strong> ${data.content}`
    document.querySelector(`.chatroom-${data.chatroom_id}`).append(messageDiv)
    // Called when there's incoming data on the websocket for this channel
  }
});
