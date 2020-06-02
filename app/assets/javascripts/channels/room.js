App.room = App.cable.subscriptions.create({
  channel: "RoomChannel",
  room_id: 3
}, {
  connected: function () {
    console.log('connected...');
  },
  disconnected: function () {
    console.log('disconnected...');
  },
  received: function (data) {
    return console.log(data);
  }
});
