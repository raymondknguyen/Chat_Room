document.addEventListener('turbolinks:load', () => {
  const room_element = document.getElementById('room-id');
  const room_id = Number(room_element.getAttribute('data-room-id'));

  App.room = App.cable.subscriptions.create({
    channel: "RoomChannel",
    room_id: room_id
  }, {
    connected: function () {
      console.log('connected to ' + room_id);
    },
    disconnected: function () {
      console.log('disconnected...');
    },
    received: function (data) {
      const user_element = document.getElementById('user-id');
      const user_id = Number(user_element.getAttribute('data-user-id'));
  
      let html;
  
      if (user_id === data.message.user_id) {
        html = data.mine 
      } else {
        html = data.theirs
    
      }
  
      const messageContainer = document.getElementById('messages')
      messageContainer.innerHTML = messageContainer.innerHTML + html
    }
  });
})

