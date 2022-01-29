import consumer from "./consumer"

consumer.subscriptions.create("ChatroomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    console.log(`.chatroom-${data.chatroom_id}`)
    console.log(document.querySelector('.chatroom-2'))
    console.log(document.querySelector(`.chatroom-${data.chatroom_id}`))
    console.log(data)
    document.querySelector(`.chatroom-${data.chatroom_id}`).append(data.content)
    // Called when there's incoming data on the websocket for this channel
  }
});
